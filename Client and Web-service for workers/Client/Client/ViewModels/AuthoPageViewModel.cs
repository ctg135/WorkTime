﻿using Client.Models;
using Client.Views;
using CommonServiceLocator;
using System;
using System.Collections.Generic;
using System.Windows.Input;
using Xamarin.Forms;

namespace Client.ViewModels
{
    class AuthoPageViewModel : BaseViewModel
    {
        /// <summary>
        /// Команда авторизации
        /// </summary>
        public ICommand Authorize { get; private set; }
        /// <summary>
        /// Команда открытия настроек
        /// </summary>
        public ICommand OpenSettings { get; private set; }
        /// <summary>
        /// Команда открытия списка сохраненных планов
        /// </summary>
        public ICommand OpenSavedPlans { get; private set; }
        /// <summary>
        /// Команда обноления настроек
        /// </summary>
        public ICommand UpdateSettings { get; private set; }
        /// <summary>
        /// Клиент для получения данных
        /// </summary>
        public IClientModel Client { get; private set; }
        /// <summary>
        /// Логин
        /// </summary>
        public string Login { get; set; }
        /// <summary>
        /// Пароль
        /// </summary>
        public string Password { get; set; }
        /// <summary>
        /// Событие отобржения списка планов
        /// </summary>
        public event ViewPlansEvent ViewPlans;

        public AuthoPageViewModel(IClientModel Client)
        {
            this.Client = Client;
            Authorize = new Command(Autho);
            OpenSavedPlans = new Command(OpenSaved);
            OpenSettings = new Command(OpenSettingsPageAsync);
            UpdateSettings = new Command(UpdateSets);
        }
        /// <summary>
        /// Команда авторизации
        /// </summary>
        private async void Autho()
        {
            var result = new AuthorizationResult();
            try
            {
                result = await Client.Authorization(Login, Password);
            }
            catch(Exception)
            {
                await Application.Current.MainPage.DisplayAlert("Ошибка авторизации", "Ошибка подключения", "Ок");
                return;
            }
            switch(result)
            {
                case AuthorizationResult.Ok:
                    await Globals.Load(Client.Session, Client.Server);
                    Application.Current.MainPage = new MainMenuPage();
                    break;
                case AuthorizationResult.Error:
                    await Application.Current.MainPage.DisplayAlert("Ошибка авторизации", "Неверное имя пользователя или пароль", "Ок");
                    break;
                default:
                    await Application.Current.MainPage.DisplayAlert("Ошибка авторизации", "Непридвиденная ошибка", "Ок");
                    break;
            }
        }
        private async void OpenSaved()
        {
            IPlanLoader planLoader = ServiceLocator.Current.GetInstance<IPlanLoader>();
            var plans = await planLoader.GetPlans();
            if (Globals.PlanTypes == null)
            {
                Globals.PlanTypes = new Dictionary<string, string>();
                Globals.PlanTypes.Add("1", "Рабочий день");
                Globals.PlanTypes.Add("2", "Выходной");
                Globals.PlanTypes.Add("3", "Больничный");
                Globals.PlanTypes.Add("4", "Отпуск");
            }
            ViewPlans(this, new ViewPlansEventArgs(plans));
        }
        /// <summary>
        /// Команда открытия страницы настроек
        /// </summary>
        private async void OpenSettingsPageAsync()
        {
            await Application.Current.MainPage.Navigation.PushAsync(new SettingsPage(false));
        }
        /// <summary>
        /// Команда для обновления настроек
        /// </summary>
        private async void UpdateSets()
        {
            Client.Server  = await Globals.Config.GetItem("Server");
            Client.Session = await Globals.Config.GetItem("Session");
        }
    }
}
