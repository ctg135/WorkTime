﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Service.Models
{
    public class Request
    {
        public string Session { get; set; }
        public object Query { get; set; }
    }
}