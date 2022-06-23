﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Dtos
{
    public class GResponseDto<T> where T : class
    {
        public T Data { get; set; }
        [JsonIgnore]
        public int  StatusCode { get; set; }
        public List<string> Errors { get; set; }

        public static GResponseDto<T> Success(int statusCode,T data)
        {
            return new GResponseDto<T> { Data=data, StatusCode=statusCode};
        }

        public static GResponseDto<T> Success(int statusCode)
        {
            return new GResponseDto<T> { StatusCode = statusCode };
        }

        public static GResponseDto<T> Fail(int statusCode,List<string> errors)
        {
            return new GResponseDto<T> { StatusCode = statusCode ,Errors=errors};
        }

        public static GResponseDto<T> Fail(int statusCode, string error)
        {
            return new GResponseDto<T> { StatusCode = statusCode, Errors = new List<string> { error } };
        }
    }
}
