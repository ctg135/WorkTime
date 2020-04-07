﻿using System;
using System.Collections.Generic;

using System.Text;
using System.Windows.Input;
using Xamarin.Forms;
using Client.DataModels;
using Client.Models;

namespace Client.ViewModels
{
    class MainPageViewModel : BaseViewModel
    {
        private IClientModel Client { get; set; }
        public ICommand Exit { get; set; }
        public ICommand SetNewStatus { get; set; }
        public string Status
        {
            get
            {
                return Globals.StatusCodes[Globals.WorkerStatus.Code].Title;
            }
        }
        public string LastUpdate
        {
            get
            {
                return Globals.WorkerStatus.LastUpdate;
            }
        }
        public Plan PlanToday { get; set; } = new Plan() { StartOfDay = "8:30" };

        public MainPageViewModel()
        {
            Exit = new Command(UnAutho);
            SetNewStatus = new Command(SetStatus);
            Client = new ClientMock(); // ТЯВА
            Globals.WorkerStatus = Client.GetLastStatusCode().Result;
        }
        private async void UnAutho()
        {

        }
        private async void SetStatus()
        {
            List<string> buts = new List<string>(Globals.Statuses.Keys);
            // ТЯВА - Добавить try catch - или потом реализовать ошибки в клиенте и читать их
            var res = await Application.Current.MainPage.DisplayActionSheet("Выбор статуса", "Отмена", null, buts.ToArray());

            await Client.SetStatus(Globals.Statuses[res].Code);
            Globals.WorkerStatus = await Client.GetLastStatusCode();
            
            NotifyPropertyChanged(nameof(Status));
            NotifyPropertyChanged(nameof(LastUpdate));
        }
    }
}
