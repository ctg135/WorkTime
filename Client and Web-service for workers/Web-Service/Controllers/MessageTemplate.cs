﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Http;

namespace Web_Service.Controllers
{
    /// <summary>
    /// Фабрика для создания шаблонных сообщений
    /// </summary>
    public class MessageTemplate
    {
        /// <summary>
        /// Сообщение о плохой ошибке
        /// </summary>
        public static HttpResponseMessage BadMessage
        {
            get
            {
                return new HttpResponseMessage()
                {
                    Content = new StringContent("{\"Message\":\"Некорректное содержимое сообщения\"}"),
                    StatusCode = HttpStatusCode.BadRequest
                };
            }
        }
        /// <summary>
        /// Сообщение о ошибке обработки сообщения
        /// </summary>
        public static HttpResponseMessage BadProcessingMessage
        {
            get
            {
                return new HttpResponseMessage()
                {
                    Content = new StringContent("{\"Message\":\"Ошибка обработки сообщения\"}"),
                    StatusCode = HttpStatusCode.Conflict
                };
            }
        }
        /// <summary>
        /// Сообщение об ошибке нахождения пользователя во время авторизации
        /// </summary>
        public static HttpResponseMessage UserNotFound
        {
            get
            {
                return new HttpResponseMessage()
                {
                    Content = new StringContent("{\"Message\":\"Пользователь не найден\"}"),
                    StatusCode = HttpStatusCode.BadRequest
                };
            }
        }
        /// <summary>
        /// Сообщение об ошибке во время создания сессии
        /// </summary>
        public static HttpResponseMessage SessionNotCreated
        {
            get
            {
                return new HttpResponseMessage()
                {
                    Content = new StringContent("{\"Message\":\"Сессия не была создана\"}"),
                    StatusCode = HttpStatusCode.Conflict
                };
            }
        }
        /// <summary>
        /// Сообщение о ненайденной сессии при авторизации
        /// </summary>
        public static HttpResponseMessage SessionNotFound
        {
            get
            {
                return new HttpResponseMessage()
                {
                    Content = new StringContent("{\"Message\":\"Сессия не была найдена\"}"),
                    StatusCode = HttpStatusCode.Unauthorized
                };
            }
        }
        /// <summary>
        /// Сообщение о ненайденном клиенте при авторизации
        /// </summary>   
        public static HttpResponseMessage ClientNotFound
        {
            get
            {
                return new HttpResponseMessage()
                {
                    Content = new StringContent("{\"Message\":\"Такой клиент не блы найден\"}"),
                    StatusCode = HttpStatusCode.Unauthorized
                };
            }
        }
        /// <summary>
        /// Сообщение о ненайденном сотруднике при поиске
        /// </summary>
        public static HttpResponseMessage WorkerNotFound
        {
            get
            {
                return new HttpResponseMessage()
                {
                    Content = new StringContent("{\"Message\":\"Работник с таким номером не был найден\"}"),
                    StatusCode = HttpStatusCode.BadRequest
                };
            }
        }
        

    }
}