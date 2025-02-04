'''
Psicobotica Backend Point of Entry (main.py)
'''
# Base imports
import os

# Web server
import uvicorn 

# FastAPI
from fastapi import FastAPI
from fastapi import status
from fastapi.middleware.cors import CORSMiddleware
from fastapi import Depends, FastAPI
from fastapi.requests import Request
from fastapi import FastAPI, HTTPException, Security
from fastapi.security import APIKeyHeader
from fastapi import APIRouter
from fastapi.encoders import jsonable_encoder

# OpenAI
import openai

# My API Data Models
import data_models

# This API API Keys - Provided as a secret in the container
Psicobotica_Key = os.environ["PSICOBOTICA_API_KEY"] 
psicobotica_api_keys = []
psicobotica_api_keys.append(Psicobotica_Key)


# OpenAI API Config

# Getting the key either hardcoded or from env (for production)
# OpenAI_Key = "sk-XXXXXXX"
OpenAI_Key = None

if (OpenAI_Key != None):
    openai.api_key = OpenAI_Key
else: 
    openai.api_key = os.environ["OPENAI_API_KEY"] 

# TODO: Hardcoded LLM model
OpenAI_LLM_model = "gpt-3.5-turbo"


# FastAPI instance
app = FastAPI(
    description="Psicobotica SaaS API Server",
    title="Psicobotica SaaS",
    docs_url="/" # Swagger docs in the root
)

# Dependency to check and validate API KEY
api_key_header = APIKeyHeader(name="X-API-Key")


'''
API Key Authentication method
'''
def get_api_key(api_key_header: str = Security(api_key_header)) -> str:
    if api_key_header in psicobotica_api_keys:
        return api_key_header
    raise HTTPException(
        status_code= status.HTTP_401_UNAUTHORIZED,
        detail="Invalid or missing API Key",
    )


# Allow CORS (TODO: To be limited later in production)
allow_all = ['*']
app.add_middleware(
   CORSMiddleware,
   allow_origins=allow_all,
   allow_credentials=True,
   allow_methods=allow_all,
   allow_headers=allow_all
)

# Real-Time Chat Prediction API router
rt_chat_router = APIRouter(
    prefix='/chat',
    tags = ['Chat API']
)


''' *** get_completion_from_messages(messages, model, temp) ***
        ---------------------------------------------------
Helper function to get a GPT 3.5 Turbo completion.
In this case, from the list of past messages.
Using the chat completion API
(https://platform.openai.com/docs/guides/gpt/chat-completions-api)

INPUT:
- messages: list of messages
- model: OpenAI model (GPT 3.5 Turbo by default)
- temp: model's temperature (0 by default)

OUTPUT:
- The instruct LLM response
'''
def get_completion_from_messages(messages, model="gpt-3.5-turbo", temp=0):
    response = openai.ChatCompletion.create(
        model=model,
        messages=messages,
        temperature=temp,
    )
    return response.choices[0].message["content"]


'''
OpenAI-based Supervision Chatbot completion end point
'''
@rt_chat_router.post('/superbot_completion', response_model=data_models.SuperBotResponse, name='Psicobotica Supervision Bot Completion')
async def superbot_completion(bot_input: data_models.SuperBotCompletionInput, api_key: str = Security(get_api_key)) -> data_models.SuperBotResponse:

    # Starting with an empty context
    context = []

    # Build the system role prompt.
    system_role_prompt = f"""Eres un asistente virtual llamado {bot_input.bot_name} y eres experto en psicología clínica con un enfoque {bot_input.approach}. \
Estás en una sesión de supervisión de casos clínicos de psicoterapia y responderas a preguntas sobre problemas específicos \
que tiene un terapeuta con su paciente. Da respuestas detalladas y completas, especificando claramente cómo se puede \
tratar el problema especificado por el terapeuta desde la corriente psicológica {bot_input.approach}.""" 
    
    # Build the user's prompt.
    user_prompt = f"""Tengo un paciente de {bot_input.patient_age} años de edad, de sexo {bot_input.patient_sex} \
e identidad de género {bot_input.patient_gender}, con diagnóstico previo de {bot_input.patient_diagnosis}. \
Desde el punto de vista {bot_input.approach} ¿Cuál sería la mejor estrategia para abordar el siguiente problema?: \
{bot_input.patient_problem}. """
    
    # Add the system role to the empty context
    context.append({'role':'system', 'content':system_role_prompt})

    # Add the user prompt context
    context.append({'role':'user', 'content':f"{user_prompt}"})

    # Get response from OpenAI
    oai_response = get_completion_from_messages(context, model=OpenAI_LLM_model, temp=0)

    # res_str = ' '.join([system_role_prompt, user_prompt, oai_response])

    res = data_models.SuperBotResponse(bot_response=oai_response)
    
    return res


'''
OpenAI-based Chatbot completion end point
'''
@rt_chat_router.post('/chatbot_completion', response_model=data_models.ChatBotResponse, name='Psicobotica Chat Bot Completion')
async def therapist_completion(bot_input: data_models.ChatBotCompletionInput, api_key: str = Security(get_api_key)) -> data_models.ChatBotResponse:

    input = jsonable_encoder(bot_input)

    # Starting with an empty context
    context = []

    # Bot's approach
    prompt_bot_approach = ""
    if bot_input.bot_approach is not None:
        prompt_bot_approach = f"con un enfoque {bot_input.bot_approach}"

    # Bot's personality
    prompt_bot_pers = ""
    if bot_input.bot_personality is not None:
        prompt_bot_pers = f"Debes mostras una personalidad {bot_input.bot_personality}."

    # Patient's name
    prompt_patient_name = ""
    if bot_input.patient_name is not None:
        prompt_patient_name = f"que se llama {bot_input.patient_name}"

    # Patient's age
    prompt_patient_age = ""
    if bot_input.patient_age is not None:
        prompt_patient_age = f"de {bot_input.patient_age} años"

    # Patient's gender
    prompt_patient_gender = ""
    if bot_input.patient_gender is not None:
        prompt_patient_gender = f"de género {bot_input.patient_gender}"

    # Patient's problem
    prompt_patient_problem = ""
    if bot_input.patient_problem is not None:
        prompt_patient_problem = f"que tiene el siguiente problema: {bot_input.patient_problem}"

    # Patient's country/region
    prompt_patient_country = ""
    if bot_input.patient_country is not None:
        prompt_patient_country = f", y vive en: {bot_input.patient_country}"

    # Bot modes prompt
    prompt_bot_mode = ""
    if bot_input.bot_mode is not None: 
        if bot_input.bot_mode == 'succint':
            prompt_bot_mode = 'Debes dar respuestas cortas para favorecer la interacción y la conversación con el paciente. No respondas con listas largas.'


    # Bot temp
    param_bot_temp = 0
    if bot_input.bot_temp is not None: 
        param_bot_temp = bot_input.bot_temp

    # Build the system role prompt.
    system_role_prompt = f"""Eres un asistente virtual de Psicobótica llamado {bot_input.bot_name} \
y eres experto en psicología clínica {prompt_bot_approach}. {prompt_bot_pers} \
Estás en una sesión con un paciente {prompt_patient_name} {prompt_patient_age} {prompt_patient_gender} {prompt_patient_problem} {prompt_patient_country}.\
{prompt_bot_mode}"""
    
    # Add the system role to the empty context
    context.append({'role':'system', 'content':system_role_prompt})

    # Add the existing messages
    context = context + input['context']

    # Get response from OpenAI
    oai_response = get_completion_from_messages(context, model=OpenAI_LLM_model, temp=param_bot_temp)

    res = data_models.ChatBotResponse(bot_response=oai_response)
    
    return res


'''
OpenAI-based simulated patient completion end point
'''
@rt_chat_router.post('/patient_completion', response_model=data_models.SimulPatientResponse, name='Psicobotica Simulated Patient Completion')
async def patient_completion(patient_input: data_models.SimulPatientCompletionInput, api_key: str = Security(get_api_key)) -> data_models.SimulPatientResponse:

    input = jsonable_encoder(patient_input)

    # Starting with an empty context
    context = []

    # Patients's personality
    prompt_pat_pers = ""
    if patient_input.patient_personality is not None:
        prompt_pat_pers = f"Debes mostras una personalidad {patient_input.patient_personality}."

    # Patient's name
    prompt_pat_name = ""
    if patient_input.patient_name is not None:
        prompt_pat_name = f"que se llama {patient_input.patient_name}"

    # Patient's age
    prompt_pat_age = ""
    if patient_input.patient_age is not None:
        prompt_pat_age = f"de {patient_input.patient_age} años"

    # Patient's gender
    prompt_pat_gender = ""
    if patient_input.patient_gender is not None:
        prompt_pat_gender = f"de género {patient_input.patient_gender}"

    # Patient's problem
    prompt_pat_problem = ""
    if patient_input.patient_problem is not None:
        prompt_pat_problem = f"En esta sesión quieres hablar del siguiente problema: {patient_input.patient_problem}."

    # Patient's diagnosys
    prompt_pat_diag = ""
    if patient_input.patient_diagnosis is not None:
        prompt_pat_diag = f"Tu comportamiento debe estar determinado por un diagnóstico de {patient_input.patient_diagnosis}."

    # Patient's country/region
    prompt_pat_country = ""
    if patient_input.patient_country is not None:
        prompt_pat_country = f"vive en {patient_input.patient_country}"

    # Bot modes prompt
    prompt_bot_mode = ""
    if patient_input.bot_mode is not None: 
        if patient_input.bot_mode == 'succint':
            prompt_bot_mode = 'Debes dar respuestas cortas para favorecer la interacción y la conversación con el terapeuta. No respondas con listas largas.'

    # Bot temp
    param_bot_temp = 0
    if patient_input.bot_temp is not None: 
        param_bot_temp = patient_input.bot_temp

    # Build the system role prompt.
    system_role_prompt = f"""Eres un paciente de salud mental {prompt_pat_age} {prompt_pat_gender} {prompt_pat_name} {prompt_pat_country} y ha acudido a una sesión de psicoterapia en el centro sanitario Psicobótica. \
{prompt_pat_pers} {prompt_pat_diag} {prompt_pat_problem}. {prompt_bot_mode}"""
    
    # Add the system role to the empty context
    context.append({'role':'system', 'content':system_role_prompt})

    # Add the existing messages
    context = context + input['context']

    # Get response from OpenAI
    oai_response = get_completion_from_messages(context, model=OpenAI_LLM_model, temp=param_bot_temp)

    res = data_models.SimulPatientResponse(patient_response=oai_response)
    
    return res


''' 
Builds a system role prompt for a Candidate bot
'''
def buildCandidatePrompt(bot_params = data_models.RecruitBotCompletionInput):
   
    # Bot modes prompt
    prompt_bot_mode = ""
    if bot_params.bot_mode is not None: 
        if bot_params.bot_mode == 'succint':
            prompt_bot_mode = 'Debes dar respuestas cortas para favorecer la interacción y la conversación. No respondas con listas largas.'

    # Bot's name
    prompt_bot_name = "Reclusim (Reclutador Simulado)" # Bot's name by default
    if bot_params.bot_name is not None:
        prompt_bot_name = f"{bot_params.bot_name}"

   # Bot's approach
    prompt_bot_approach = ""
    if bot_params.bot_approach is not None:
        prompt_bot_approach = f"con un enfoque {bot_params.bot_approach}"

    # Bot's personality
    prompt_bot_pers = ""
    if bot_params.bot_personality is not None:
        prompt_bot_pers = f"Debes mostras una personalidad {bot_params.bot_personality}."

    # Candidates's name
    prompt_cand_name = "Candisim (Candidato Simulado)"
    if bot_params.cand_name is not None:
        prompt_cand_name = f"{bot_params.cand_name}"

    # Candidate's age
    prompt_cand_age = ""
    if bot_params.cand_age is not None:
        prompt_cand_age = f"tienes {bot_params.cand_age} años"

    # Candidates's gender
    prompt_cand_gender = ""
    if bot_params.cand_gender is not None:
        prompt_cand_gender = f"eres {bot_params.cand_gender}"

    # Candidate's resume
    prompt_cand_resume = ""
    if bot_params.cand_resume is not None:
        prompt_cand_resume = f"#### {bot_params.cand_resume}"

    # Candidate's personality
    prompt_cand_pers = ""
    if bot_params.cand_personality is not None:
        prompt_cand_pers = f"Durante la entrevista debes mostrar una personalidad {bot_params.cand_personality}"

    # Candidates's country/region
    prompt_cand_country = ""
    if bot_params.cand_country is not None:
        prompt_cand_country = f"y vives en: {bot_params.cand_country}"

    # Job title
    prompt_job_company = ""
    if bot_params.job_company is not None:
        prompt_job_title = f"{bot_params.job_company}"

    # Job title
    prompt_job_title = ""
    if bot_params.job_title is not None:
        prompt_job_title = f"{bot_params.job_title}"

    # Job desc
    prompt_job_desc = ""
    if bot_params.job_desc is not None:
        prompt_job_desc = f"{bot_params.job_desc}"

    # Job skills
    prompt_job_skills = ""
    if bot_params.job_skills is not None:
        prompt_job_skills = f"{bot_params.job_skills}"

    # Job num questiong
    prompt_num_questions = ""
    if bot_params.job_num_questions is not None:
        prompt_num_questions = f"Debes hacer {bot_params.job_num_questions} preguntas"

    # Build and return the system role prompt.
    return f"""Eres un candidato a un puesto de trabajo en la empresa {prompt_job_company}, tu nombre es {prompt_cand_name} \
{prompt_cand_age} {prompt_cand_gender} {prompt_cand_country}. El puesto al que aspiras es {prompt_job_title} \
y la descripción del puesto es la siguiente: {prompt_job_desc}. Para este puesto piden las siguientes competencias: \
{prompt_job_skills}. Un reclutador de la empresa {prompt_job_company} te hará unas {prompt_num_questions} preguntas para \
determinar si eres apto para el puesto. Debes contestar lo mejor posible para conseguir el puesto, basándote en la \
información de tu CV que es el siguiente: {prompt_cand_resume}. {prompt_cand_pers}. {prompt_bot_mode}"""
    

''' 
Builds a system role prompt for a Recruiter bot
'''
def buildRecruiterPrompt(bot_params = data_models.RecruitBotCompletionInput):

    # Bot modes prompt
    prompt_bot_mode = ""
    if bot_params.bot_mode is not None: 
        if bot_params.bot_mode == 'succint':
            prompt_bot_mode = 'Debes dar respuestas cortas para favorecer la interacción y la conversación. No respondas con listas largas.'

    # Bot's name
    prompt_bot_name = "Reclusim (Reclutador Simulado)" # Bot's name by default
    if bot_params.bot_name is not None:
        prompt_bot_name = f"{bot_params.bot_name}"

   # Bot's approach
    prompt_bot_approach = ""
    if bot_params.bot_approach is not None:
        prompt_bot_approach = f"con un enfoque {bot_params.bot_approach}"

    # Bot's personality
    prompt_bot_pers = ""
    if bot_params.bot_personality is not None:
        prompt_bot_pers = f"Debes mostras una personalidad {bot_params.bot_personality}."

    # Candidates's name
    prompt_cand_name = "Candisim (Candidato Simulado)"
    if bot_params.cand_name is not None:
        prompt_cand_name = f"{bot_params.cand_name}"

    # Candidate's age
    prompt_cand_age = ""
    if bot_params.cand_age is not None:
        prompt_cand_age = f"que tiene {bot_params.cand_age} años"

    # Candidates's gender
    prompt_cand_gender = ""
    if bot_params.cand_gender is not None:
        prompt_cand_gender = f"que es {bot_params.cand_gender}"

    # Candidate's resume
    prompt_cand_resume = ""
    if bot_params.cand_resume is not None:
        prompt_cand_resume = f"#### {bot_params.cand_resume}"

    # Candidate's personality
    prompt_cand_pers = ""
    if bot_params.cand_personality is not None:
        prompt_cand_pers = f"Durante la entrevista debes mostrar una personalidad {bot_params.cand_personality}"

    # Candidates's country/region
    prompt_cand_country = ""
    if bot_params.cand_country is not None:
        prompt_cand_country = f"y vives en: {bot_params.cand_country}"

    # Job title
    prompt_job_company = ""
    if bot_params.job_company is not None:
        prompt_job_title = f"{bot_params.job_company}"

    # Job title
    prompt_job_title = ""
    if bot_params.job_title is not None:
        prompt_job_title = f"{bot_params.job_title}"

    # Job desc
    prompt_job_desc = ""
    if bot_params.job_desc is not None:
        prompt_job_desc = f"{bot_params.job_desc}"

    # Job skills
    prompt_job_skills = ""
    if bot_params.job_skills is not None:
        prompt_job_skills = f"{bot_params.job_skills}"

    # Job num questiong
    prompt_num_questions = ""
    if bot_params.job_num_questions is not None:
        prompt_num_questions = f"Debes hacer {bot_params.job_num_questions} preguntas"

    # Build and return the system role prompt.
    return f"""Trabajas en Recursos Humanos. Eres un reclutador de la empresa {prompt_job_company}, tu nombre es {prompt_bot_name} \
Estás haciendo una entrevista de trabajo a un candidato llamado {prompt_cand_name} {prompt_cand_gender} {prompt_cand_age}. \
El título del puesto de trabajo para el que estás seleccionando candidatos es {prompt_job_title} \
y la descripción del puesto es la siguiente: {prompt_job_desc}. Para este puesto debes comprobar que el candidato tiene las siguientes competencias: \
{prompt_job_skills}. Debes hacer unas {prompt_num_questions} preguntas al candidato {prompt_bot_approach} para determinar si es apto para el puesto. \
Trata de comprobar si el candidato tiene realmente las competencias que aparecen en su curriculum. \
La información del CV del candidato es la siguiente: {prompt_cand_resume}. {prompt_bot_pers}. {prompt_bot_mode}"""



'''
OpenAI-based recruitment completion end point
'''
@rt_chat_router.post('/recruitment_completion', response_model=data_models.RecruitmentBotResponse, name='Psicobotica Recruitment Bot Completion')
async def recruitment_completion(bot_input: data_models.RecruitBotCompletionInput, api_key: str = Security(get_api_key)) -> data_models.RecruitmentBotResponse:

    # Decoding the json list with context messages
    input = jsonable_encoder(bot_input)

    # Starting with an empty context
    context = []

    # Bot's Role: Either recruiter or candidate
    isCandidate = False # Recruiter by default
    if (bot_input.bot_role == 'candidate'):
        isCandidate = True

    system_role_prompt = ""

    if isCandidate:
        system_role_prompt = buildCandidatePrompt(bot_params=bot_input)
    else:
        system_role_prompt = buildRecruiterPrompt(bot_params=bot_input)

    # Bot temp
    param_bot_temp = 0
    if bot_input.bot_temp is not None: 
        param_bot_temp = bot_input.bot_temp

   
    # Add the system role to the empty context
    context.append({'role':'system', 'content':system_role_prompt})

    # Add the existing messages
    context = context + input['context']

    # Get response from OpenAI
    oai_response = get_completion_from_messages(context, model=OpenAI_LLM_model, temp=param_bot_temp)

    return data_models.RecruitmentBotResponse(bot_response=oai_response)
    


#including routers
app.include_router(rt_chat_router)



# Run the FastAPI app with uvicorn
# Not needed if we're running in a container as it'll be launched from the CMD
# if __name__ == "__main__":
#    uvicorn.run("main:app", reload=True)

