using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using SampleEntDev.API.Filter;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.Schemas.ECommerce;
using SampleEntDev.Core.Entities;
using SampleEntDev.Core.Entities.Schemas;
using SampleEntDev.Core.Services;

namespace SampleEntDev.API.Controllers
{
    public abstract class GControllers<TDefaultDtoModel, TEntity> : BaseController<TDefaultDtoModel>
        where TDefaultDtoModel : class, IDto where TEntity : class, IEntity
    {
        private readonly IMapper _mapper;
        private readonly IGenericService<TEntity> _service;


        protected GControllers(IMapper mapper, IGenericService<TEntity> service)
        {
            _mapper = mapper;
            _service = service;
        }

        // GET: api/<GController>
        [HttpGet]
        
        public async Task<IActionResult> Get()
        {
            var p = await _service.GetAllAsync();
            var pDto = _mapper.Map<List<TDefaultDtoModel>>(p);
            return CreateActionResult(GResponseDto<List<TDefaultDtoModel>>.Success(200, pDto));
        }

        // GET api/<GController>/5
        [HttpGet("{id:int}")]
        public async Task<IActionResult> Get(int id)
        {
            var p = await _service.GetByIdAsync(id);
            var pDto = _mapper.Map<TDefaultDtoModel>(p);
            return CreateActionResult(GResponseDto<TDefaultDtoModel>.Success(200, pDto));
        }

        // POST api/<GController>
        [HttpPost]
        public async Task<IActionResult> Post(TDefaultDtoModel pDto)
        {
            var p = await _service.AddAsync(_mapper.Map<TEntity>(pDto));
            var savedEnt = _mapper.Map<TDefaultDtoModel>(p);
            return CreateActionResult(GResponseDto<TDefaultDtoModel>.Success(201, savedEnt));
        }

        // PUT api/<GController>/5
        [HttpPut]
        public async Task<IActionResult> Put(TDefaultDtoModel pDto)
        {
            await _service.UpdateAsync(_mapper.Map<TEntity>(pDto));
            return CreateActionResult(GResponseDto<NoContentDto>.Success(204));
        }

        // DELETE api/<GController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> RemoveAsync(int id)
        {
            var p = await _service.GetByIdAsync(id);
            await _service.RemoveAsync(p);
            return CreateActionResult(GResponseDto<NoContentDto>.Success(204));
        }
    }
}