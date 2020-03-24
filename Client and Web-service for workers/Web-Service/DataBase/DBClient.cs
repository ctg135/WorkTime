﻿using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web_Service.Models;

namespace Web_Service.DataBase
{
    /// <summary>
    /// Предоставляет клиент для работы с базой данных
    /// </summary>
    public static class DBClient
    {
        /// <summary>
        /// Экземпляр для работы с базой данных
        /// </summary>
        public static IDBWorker DB { get; set; }
        /// <summary>
        /// Функция записи сессии в базу данных
        /// </summary>
        /// <exception cref="Exception">Ошибка запроса</exception>
        public static void CreateSession(string WorkerId, string SessionHash, string ClientInfo, DateTime DateCreation) 
        => DB.Insert("sessions", new Dictionary<string, string>() 
        {
            { "WorkerId",   WorkerId },
            { "Token",      SessionHash },
            { "ClientInfo", ClientInfo },
            { "Created",    DateCreation.ToString("yyyy-MM-dd HH:mm:ss") },
        });
        /// <summary>
        /// Возаращает Id работника по данным авторизации
        /// <br><c>string.Empty</c> - в случае ненахождения такого</br>
        /// </summary>
        /// <param name="Login">Логин работника</param>
        /// <param name="Password">Пароль работника</param>
        /// <returns>Id работника</returns>
        /// <exception cref="Exception">Ошибка запроса</exception>
        public static string GetWorkerId(string Login, string Password)
        {
            DataTable data = DB.MakeQuery($"SELECT `Id` FROM `workers` WHERE `Login` = '{Login}' AND `Password` = '{Password}';");
            string id = string.Empty;
            if(data.Rows.Count == 1)
            {
                id = data.Rows[0][0].ToString();
            }
            return id;
        }
        /// <summary>
        /// Получение Id работника по сессии
        /// </summary>
        /// <param name="Session">Хэш сессиии</param>
        /// <returns>Id работника</returns>
        /// <exception cref="Exception">Ошибка запроса</exception>
        public static string GetWorkerId(string Session)
        {
            string id = string.Empty;

            DataTable data = DB.MakeQuery($"SELECT `Id` FROM `sessions` WHERE `Token` = '{Session}'");
            if (data.Rows.Count == 1)
            {
                id = data.Rows[0][0].ToString();
            }

            return id;
        }
        /// <summary>
        /// Получение клиента работника по сессии
        /// </summary>
        /// <param name="Session">Хэш сессии</param>
        /// <returns>Клиент сотрудника</returns>
        /// <exception cref="Exception">Ошибка запроса</exception>
        public static string GetClientInfo(string Session)
        {
            string client = string.Empty;

            DataTable data = DB.MakeQuery($"SELECT `ClientInfo` FROM `sessions` WHERE `Token` = '{Session}'");
            if (data.Rows.Count == 1)
            {
                client = data.Rows[0][0].ToString();
            }

            return client;
        }
        /// <summary>
        /// Функция получения информации о сотруднике
        /// </summary>
        /// <param name="WorkerId">Идентификатор сотрудника</param>
        /// <returns>Информация о сотруднике</returns>
        /// <exception cref="Exception">Ошибка запроса</exception>
        public static Worker GetWorker(string WorkerId)
        {
            var data = DB.MakeQuery($"SELECT * FROM `workers` WHERE `Id` = '{WorkerId}'");

            if(data.Rows.Count != 1)
            {
                throw new Exception("Работник не найден");
            }

            Worker worker = new Worker()
            {
                Name        = data.Rows[0]["Name"].ToString(),
                Surname     = data.Rows[0]["Surname"].ToString(),
                Patronymic  = data.Rows[0]["Patronymic"].ToString(),
                BirthDate   = data.Rows[0]["BirthDate"].ToString(),
                Mail        = data.Rows[0]["Mail"].ToString(),
                Position    = data.Rows[0]["Position"].ToString(),
                Rate        = data.Rows[0]["Rate"].ToString(),
                AccessLevel = data.Rows[0]["AccessLevel"].ToString()
            };
            return worker;
        }
    }
}