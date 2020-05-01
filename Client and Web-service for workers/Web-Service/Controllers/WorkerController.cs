﻿using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using Web_Service.DataBase;
using Web_Service.Loggers;

namespace Web_Service.Controllers
{
    public class WorkerController : ApiController
    {
        /// <summary>
        /// Контроллер получения информации о сотруднике
        /// <br>POST: api/Worker</br>
        /// </summary>
        /// <param name="request">Соообщение-запрос</param>
        /// <returns>Информация о сотруднике</returns>
        public async Task<HttpResponseMessage> Post(HttpRequestMessage request)
        {
            string ClientInfo = request.Headers.UserAgent.ToString();
            Logger.WorkerLog.Info($"POST Получено сообщение от {ClientInfo}");
            HttpResponseMessage response = new HttpResponseMessage();

            var req = new Data.Request.WorkerInfoRequest();
            string WorkerId = string.Empty;

            try
            {
                req = JsonConvert.DeserializeObject<Data.Request.WorkerInfoRequest>(await request.Content.ReadAsStringAsync());
            }
            catch (Exception exc)
            {
                Logger.WorkerLog.Error(exc, "POST Ошибка сериализации");
                return MessageTemplate.SerializationError;
            }

            if(string.IsNullOrEmpty(req.Session))
            {
                Logger.WorkerLog.Warn("POST Пустой номер сессии");
            }

            Logger.StatusLog.Debug($"POST Авторизация сессии {req.Session}");

            switch (Authentication.Authenticate(req.Session, ClientInfo))
            {
                case AuthenticationResult.Ok:
                    break;

                case AuthenticationResult.SessionNotFound:
                    Logger.WorkerLog.Info("POST Сессия не найдена");
                    return MessageTemplate.SessionNotFound;

                case AuthenticationResult.ClientNotFound:
                    Logger.WorkerLog.Info("POST Клиент не найден");
                    return MessageTemplate.ClientNotFound;
            }

            Logger.WorkerLog.Debug($"POST Поиск работника по сессии {req.Session}");

            try
            {
                WorkerId = DBClient.GetWorkerId(req.Session);
            }
            catch (Exception exc)
            {
                Logger.WorkerLog.Fatal(exc, "POST Ошибка поиска сотрудника");
                return MessageTemplate.InternalError;
            }

            var worker = new Data.Response.WorkerInfo();

            try
            {
                worker = DBClient.GetWorker(WorkerId);
            }
            catch (Exception exc)
            {
                Logger.WorkerLog.Fatal(exc, $"POST Ошибка поиска информации о работнике #{WorkerId}");
                return MessageTemplate.WorkerNotFound;
            }

            response.Content = new StringContent(JsonConvert.SerializeObject(worker));

            Logger.WorkerLog.Info($"POST Отправка ответа {ClientInfo}");
            return response;
        }
    }
}
