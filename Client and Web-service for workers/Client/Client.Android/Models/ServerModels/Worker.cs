﻿namespace Client.Droid.Models.ServerModels
{
    /// <summary>
    /// Модель данных для сотрудника
    /// </summary>
    public class Worker
    {
        public string Name        { get; set; }
        public string Surname     { get; set; }
        public string Patronymic  { get; set; }
        public string BirthDate   { get; set; }
        public string Mail        { get; set; }
        public string Position    { get; set; }
        public string Rate        { get; set; }
        public string AccessLevel { get; set; }
    }
}