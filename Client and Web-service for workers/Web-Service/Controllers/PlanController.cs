﻿using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using Web_Service.DataBase;
using Web_Service.Loggers;
using Web_Service.Models;

namespace Web_Service.Controllers
{
    public class PlanController : ApiController
    {
        /// <summary>
        /// <code>api/Post GET</code>
        /// Контроллер получения типов планов
        /// </summary>
        /// <param name="request">Сообщение-запрос</param>
        /// <returns>Список типов планов</returns>
        public async Task<HttpResponseMessage> Get(HttpRequestMessage request)
        {
            string ClientInfo = request.Headers.UserAgent.ToString();
            Logger.PlanLog.Info($"GET Получено сообщение от {ClientInfo}");

            HttpResponseMessage response = new HttpResponseMessage();

            try
            {
                string plans = JsonConvert.SerializeObject(DBClient.GetPlanTypes());
                response.Content = new StringContent(plans);
            }
            catch (Exception exc)
            {
                Logger.PlanLog.Fatal(exc, "GET Ошибка получения статусов");
                return MessageTemplate.InternalError;
            }

            response.StatusCode = HttpStatusCode.OK;
            return await Task.FromResult(response);
        }
        /// <summary>
        /// КОнтроллер для получения планов на выбранное количество дней 
        /// <code>POST: api/Plan</code>
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public async Task<HttpResponseMessage> Post(HttpRequestMessage request)
        {
            string ClientInfo = request.Headers.UserAgent.ToString();
            Logger.PlanLog.Info($"POST Получено сообщение от {ClientInfo}");

            HttpResponseMessage response = new HttpResponseMessage();

            string WorkerId     = string.Empty;
            string Session      = string.Empty;
            string StartDateStr = string.Empty;
            string EndDateStr   = string.Empty;

            DateTime StartDate;
            DateTime EndDate;

            try
            {
                var json = JObject.Parse(await request.Content.ReadAsStringAsync());
                Session      = (string)json["Session"];
                StartDateStr = (string)json["Query"]["StartDate"];
                EndDateStr   = (string)json["Query"]["EndDate"];
            }
            catch (Exception exc)
            {
                Logger.PlanLog.Error(exc, $"POST Ошибка сериализации в {await request.Content.ReadAsStringAsync()}");
                return MessageTemplate.BadMessage;
            }

            if (string.IsNullOrEmpty(Session))
            {
                Logger.PlanLog.Warn("POST Пустая строка сессии");
                return MessageTemplate.BadMessage;
            }

            try
            {
                StartDate = DateTime.Parse(StartDateStr);
                EndDate   = DateTime.Parse(EndDateStr);
                
            }
            catch(Exception)
            {
                Logger.PlanLog.Error("POST Ошибка преобразования строки в дату");
                return MessageTemplate.BadMessage;
            }

            if (StartDate > EndDate)
            {
                Logger.PlanLog.Error("POST Некорректный дипазон дат");
                return MessageTemplate.BadDatesGived;
            }

            try
            {
                WorkerId = DBClient.GetWorkerId(Session);
            }
            catch(Exception exc)
            {
                Logger.PlanLog.Fatal(exc, "POST Работник не найден");
                return MessageTemplate.BadMessage;
            }

            switch (Authentication.Authenticate(Session, ClientInfo))
            {
                case AuthenticationResult.Ok:
                    break;

                case AuthenticationResult.SessionNotFound:
                    Logger.PlanLog.Error("POST Сессия не найдена");
                    return MessageTemplate.SessionNotFound;

                case AuthenticationResult.ClientNotFound:
                    Logger.PlanLog.Error("POST Клиент не найден");
                    return MessageTemplate.ClientNotFound;
            }

            try
            {
                Logger.PlanLog.Debug($"POST Поиск планов для #{WorkerId} между {StartDate.ToString("dd:MM:yyyy")} и {EndDate.ToString("dd:MM:yyyy")}");

                List<Plan> plans = new List<Plan>(DBClient.GetPlans(WorkerId, StartDate, EndDate));
                response.Content = new StringContent(JsonConvert.SerializeObject(plans));

                Logger.PlanLog.Debug($"POST Всего найдено {plans.Count.ToString()} планов для #{WorkerId}");
            }
            catch (Exception exc)
            {
                Logger.PlanLog.Error(exc, "Ошибка получения планов");
                return MessageTemplate.InternalError;
            }

            Logger.PlanLog.Info($"POST Отправка ответа {ClientInfo}");
            return response;
        }
    }
}
