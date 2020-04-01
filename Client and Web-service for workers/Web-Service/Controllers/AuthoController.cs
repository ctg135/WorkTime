﻿using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using Web_Service.DataBase;
using Web_Service.Loggers;
using Web_Service.Models;

namespace Web_Service.Controllers
{
    public class AuthoController : ApiController
    {
        /// <summary>
        /// Авторизация
        /// <code>POST: api/Autho</code>
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public async Task<HttpResponseMessage> Post(HttpRequestMessage request)
        {
            string ClientInfo = request.Headers.UserAgent.ToString();
            Logger.AuthoLog.Info($"POST Получено сообщение от {ClientInfo}");
            HttpResponseMessage response = new HttpResponseMessage();
            
            Autho data = new Autho();
            try
            {
                data = JsonConvert.DeserializeObject<Autho>(await request.Content.ReadAsStringAsync());
            }
            catch(Exception exc)
            {
                Logger.AuthoLog.Error($"POST Ошибка сериализации полученного сообщения: {exc.Message} в \"{await request.Content.ReadAsStringAsync()}\"");
                return MessageTemplate.BadProcessingMessage;
            }

            if(string.IsNullOrEmpty(data.Login) || string.IsNullOrEmpty(data.Password))
            {
                Logger.AuthoLog.Warn("POST Пустые данные авторизации");
            }

            string WorkerId = string.Empty;

            try
            {
                WorkerId = DBClient.GetWorkerId(data.Login, data.Password);
            }
            catch (Exception exc)
            {
                Logger.AuthoLog.Fatal($"POST Ошибка поиска сотрудника #{WorkerId}", exc);
                return MessageTemplate.UserNotFound;
            }

            if(string.IsNullOrEmpty(WorkerId))
            {
                Logger.AuthoLog.Error($"POST Работник #{WorkerId} не найден");
                return MessageTemplate.UserNotFound;
            }

            DateTime dateOfCreation = DateTime.Now;

            string sessionHash = Authentication.CreateSessionHash(
                data.Login,
                data.Password,
                ClientInfo,
                dateOfCreation
            );

            Logger.AuthoLog.Info($"POST Сгенерирована сессия {sessionHash} для #{WorkerId}");

            try
            {
                DBClient.CreateSession(WorkerId, sessionHash, ClientInfo, dateOfCreation);
            }
            catch (Exception exc)
            {
                Logger.AuthoLog.Fatal($"POST Не удалось создать сессию для #{WorkerId}", exc);
                return MessageTemplate.SessionNotCreated;
            }

            Logger.AuthoLog.Info($"POST Сессия {sessionHash} создана в базе данных");
            
            response.Content = new StringContent("{\"Session\":\"" + sessionHash + "\"}");
            Logger.AuthoLog.Info($"POST Отправка ответа {ClientInfo}");

            return response;
        }
    }
}
