﻿using AutoMapper;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.Schemas.ECommerce;
using SampleEntDev.Core.Entities.Schemas;
using SampleEntDev.Core.IUnitOfWorks;
using SampleEntDev.Core.Repositories;
using SampleEntDev.Core.Repositories.Schemas.ECommerce;
using SampleEntDev.Core.Services.Schemas.ECommerce;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace SampleEntDev.Service.Services.Schemas.ECommerce
{
    public class ProductService : GenericService<Product>, IProductService
    {
        private readonly IProductRepository _productRepository;
        private readonly IMapper _mapper;

        public ProductService(IGenericRepository<Product> repository, IUnitOfWork unitOfWork,
            IProductRepository productRepository, IMapper mapper, IHttpContextAccessor httpContextAccessor) : base(
            repository, unitOfWork, httpContextAccessor)
        {
            _productRepository = productRepository;
            _mapper = mapper;
        }

        public async Task<GResponseDto<List<ProductWithCategoryDto>>> GetProductWithCategory()
        {
            var p = await _productRepository.GetProductWithCategory();
            var dto = _mapper.Map<List<ProductWithCategoryDto>>(p);
            return GResponseDto<List<ProductWithCategoryDto>>.Success(200, dto);
        }
    }
}