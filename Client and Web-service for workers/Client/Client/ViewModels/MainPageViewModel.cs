﻿using System;
using System.Collections.Generic;

using System.Text;
using System.Windows.Input;
using Xamarin.Forms;
using Client.DataModels;
using Client.Models;
using Client.Views;
using System.Globalization;

namespace Client.ViewModels
{
    class MainPageViewModel : BaseViewModel
    {
        private IClientModel Client { get; set; }
        public ICommand ExitAcc { get; private set; }
        public ICommand SetNewStatus { get; private set; }
        public ICommand UpdateData { get; private set; }
        /// <summary>
        /// Статус работника
        /// </summary>
        public string Status
        {
            get
            {
                if (Globals.WorkerStatus.Code == StatusCode.Empty().Code) return "-";
                return Globals.StatusCodes[Globals.WorkerStatus.Code].Title;
            }
        }
        /// <summary>
        /// График на сегодня
        /// </summary>
        public Plan1 PlanToday { get; set; }
        /// <summary>
        /// Список задач
        /// </summary>
        public Tasks Tasks { get; set; }
        public MainPageViewModel(IClientModel Client)
        {
            ExitAcc = new Command(UnAutho);
            SetNewStatus = new Command(SetStatus);
            UpdateData = new Command(UpdateProps);

            this.Client = Client;
            this.Client.Session = Globals.Config.GetItem("Session").Result;
            this.Client.Server = Globals.Config.GetItem("Server").Result;
            Tasks = new Tasks();
            PlanToday = Plan1.Empty();
            Globals.WorkerStatus = StatusCode.Empty();
        }
        /// <summary>
        /// Комманда выхода
        /// </summary>
        private void UnAutho()
        {
            Globals.Clear();
            Application.Current.MainPage = new NavigationPage(new AuthoPage());
        }
        /// <summary>
        /// Команда установки статуса
        /// </summary>
        private async void SetStatus()
        {
            string[] buts = new string[3]
            {
                Globals.StatusCodes["2"].Title,
                Globals.StatusCodes["3"].Title,
                Globals.StatusCodes["5"].Title
            };
            string butCancel = "Отмена";
            
            var res = await Application.Current.MainPage.DisplayActionSheet("Выбор статуса", butCancel, null, buts);

            if (res == butCancel || res == null)
            {
                return;
            }

            try
            {
                await Client.SetStatus(Globals.Statuses[res].Code);
                Globals.WorkerStatus = await Client.GetLastStatusCode();
            }
            catch (Exception exc)
            {
                await Application.Current.MainPage.DisplayAlert("Ошибка установки статуса", exc.Message, "Ок");
                return;
            }

            NotifyPropertyChanged(nameof(Status));
        }
        /// <summary>
        /// Команда обноления планов и статуса на форме
        /// </summary>
        public async void UpdateProps()
        {
            try
            {
                Globals.WorkerStatus = await Client.GetLastStatusCode();
                PlanToday = await Client.GetTodayPlan();
                string type = PlanToday.TypePlan;
                PlanToday.TypePlan = Globals.PlanTypes[type].ToLower();
                if (type == "1")
                {
                    PlanToday.TypePlan += $" с {PlanToday.StartDay} до {PlanToday.EndDay}";
                }
                Tasks = new Tasks( await Client.GetTasks(new TaskStages[] { TaskStages.NotAccepted, TaskStages.Processing }));
            }
            catch (Exception exc)
            {
                await FatalError(exc.Message);
                return;
            }

            NotifyPropertyChanged(nameof(Status));
            NotifyPropertyChanged(nameof(PlanToday));
            NotifyPropertyChanged(nameof(Tasks));
        }
    }
    /// <summary>
    /// Конвертер строки в строку с 15 символами и "..." на конце
    /// </summary>
    public class ToString1518 : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            string res = value as string;
            if (res.Length > 15)
            {
                res = res.Remove(15);
                res += "...";
            }
            return res;
        }
        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return value;
        }
    }
}
