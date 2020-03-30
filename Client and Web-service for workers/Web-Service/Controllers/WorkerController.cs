﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using Newtonsoft.Json.Linq;
using Web_Service.DataBase;
using Web_Service.Models;

namespace Web_Service.Controllers
{
    public class WorkerController : ApiController
    {
        // 
        /// <summary>
        /// Контроллер получения информации о сотруднике
        /// <br>POST: api/Worker</br>
        /// </summary>
        /// <param name="request">Соообщение-запрос</param>
        /// <returns></returns>
        public async Task<HttpResponseMessage> Post(HttpRequestMessage request)
        {
            string ClientInfo = request.Headers.UserAgent.ToString();
            Logger.WorkerLog.Info($"POST Получено сообщение от {ClientInfo}");
            HttpResponseMessage response = new HttpResponseMessage();

            string Session = "";

            try
            {
                var json = JObject.Parse(await request.Content.ReadAsStringAsync());
                Session = (string)json["Session"];
            }
            catch (Exception exc)
            {
                Logger.WorkerLog.Error("POST Ошибка сериализации", exc);
                return MessageTemplate.BadMessage;
            }

            if(string.IsNullOrEmpty(Session))
            {
                Logger.WorkerLog.Error("POST Пустой номер сессии");
                return MessageTemplate.BadMessage;
            }

            string WorkerId = DBClient.GetWorkerId(Session);

            switch (Authentication.Authenticate(Session, ClientInfo))
            {
                case AuthenticationResult.Ok:
                    Worker worker = new Worker();
                    try
                    {
                        worker = DBClient.GetWorker(WorkerId);
                    }
                    catch(Exception exc)
                    {
                        Logger.WorkerLog.Error("POST Ошибка поиска работника", exc);
                        return MessageTemplate.WorkerNotFound;
                    }
                    response.Content = new StringContent(JsonConvert.SerializeObject(worker));
                    break;

                case AuthenticationResult.SessionNotFound:
                    Logger.WorkerLog.Info("POST Сессия не найдена");
                    return MessageTemplate.SessionNotFound;

                case AuthenticationResult.ClientNotFound:
                    Logger.WorkerLog.Info("POST Клиент не найден");
                    return MessageTemplate.ClientNotFound;
            }
            Logger.WorkerLog.Info($"POST Отправка ответа {ClientInfo}");
            return response;
        }
    }
}