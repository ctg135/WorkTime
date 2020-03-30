﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Web_Service.Models;
using Web_Service.DataBase;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Threading.Tasks;

namespace Web_Service.Controllers
{
    public class PlanController : ApiController
    {
        public async Task<HttpResponseMessage> Post(HttpRequestMessage request)
        {
            string ClientInfo = request.Headers.UserAgent.ToString();
            Logger.PlanLog.Info($"POST Получено сообщение от {ClientInfo}");

            HttpResponseMessage response = new HttpResponseMessage();

            string Session = string.Empty;
            int Days = 0;

            try
            {
                var json = JObject.Parse(await request.Content.ReadAsStringAsync());
                Session = (string)json["Session"];
                Days = (int)json["Query"]["Days"];
            }
            catch (Exception exc)
            {
                Logger.PlanLog.Error("POST Ошибка сериализации", exc);
                return MessageTemplate.BadMessage;
            }

            if (string.IsNullOrEmpty(Session) || Days <= 0)
            {
                Logger.PlanLog.Error("POST Неверные значения запроса");
                return MessageTemplate.BadMessage;
            }

            string WorkerId = string.Empty;

            try
            {
                WorkerId = DBClient.GetWorkerId(Session);
            }
            catch(Exception exc)
            {
                Logger.PlanLog.Error("POST Работник не найден", exc);
                return MessageTemplate.BadMessage;
            }

            switch (Authentication.Authenticate(Session, ClientInfo))
            {
                case AuthenticationResult.Ok:
                    break;

                case AuthenticationResult.SessionNotFound:
                    Logger.PlanLog.Info("POST Сессия не найдена");
                    return MessageTemplate.SessionNotFound;

                case AuthenticationResult.ClientNotFound:
                    Logger.PlanLog.Info("POST Клиент не найден");
                    return MessageTemplate.ClientNotFound;
            }

            try
            {
                List<Plan> plans = new List<Plan>(DBClient.GetPlans(WorkerId, DateTime.Now, Days));
                response.Content = new StringContent(JsonConvert.SerializeObject(plans));
            }
            catch (Exception exc)
            {
                Logger.PlanLog.Error("Ошибка получения планов", exc);
                return MessageTemplate.BadProcessingMessage;
            }

            Logger.PlanLog.Info($"POST Отправка ответа {ClientInfo}");
            return response;
        }
    }
}