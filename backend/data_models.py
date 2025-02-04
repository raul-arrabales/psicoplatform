'''
Psicobotica SaaS Platform: API DATA MODELS
'''

from pydantic import BaseModel,Field, validator, constr
from typing import Optional, List
from uuid import UUID, uuid4



# Data schema for supervision bot input, without previous context
class SuperBotCompletionInput(BaseModel):
    userid: str = Field(min_length=1)  # User ID for permissions, logging, billing, etc.
    bot_name: Optional[str] = None     # Prompt Eng.: The name of the bot
    approach: Optional[str] = None     # Prompt Eng.: System role
    patient_age: str = Field(min_length=1)   # Patient data
    patient_sex: str = Field(min_length=1)   # Patient data
    patient_gender: str = Field(min_length=1)   # Patient data
    patient_diagnosis: Optional[str] = Field(min_length=1)   # Patient data
    patient_problem: str = Field(min_length=1)   # Patient data

    class Config:
        json_schema_extra = {
            "example":{
                "userid": str(uuid4()),
                "bot_name": "Carl",
                "approach": "Cognitivo Conductual",
                "patient_age": "22",
                "patient_sex" : "mujer",
                "patient_gender" : "mujer", 
                "patient_diagnosis" : "ansiedad y depresión", 
                "patient_problem" : "se hace cortes con cuchillas en los antebrazos",
            }
        }

# Data schema Supervision Bot Response
class SuperBotResponse(BaseModel):
    bot_response: str
    

# Data schema for a chat message
class ChatMessage(BaseModel):
    role: str
    content: str


# Data schema for Psicobotica chat bot input, with context
class ChatBotCompletionInput(BaseModel):
    userid: str = Field(min_length=1)  # User ID for permissions, logging, billing, etc.
    bot_name: Optional[str] = None     # Prompt Eng.: The name of the bot
    bot_approach: Optional[str] = None     # Prompt Eng.: System role
    bot_personality: Optional[str] = None
    bot_mode: Optional[str] = None
    bot_temp: Optional[float] = None
    patient_name: Optional[str] = None # Patient data
    patient_age: Optional[str] = None  # Patient data
    patient_gender: Optional[str] = None  # Patient data
    patient_problem: Optional[str] = None 
    patient_country: Optional[str] = None
    context: List[ChatMessage] # Previous messages
    
    class Config:
        json_schema_extra = {
            "example":{
                "userid": str(uuid4()),
                "bot_name": "Carl",
                "bot_mode": "succint",
                "bot_temp": "0",
                "approach": "Cognitivo Conductual",
                "patient_age": "22",
                "patient_gender" : "mujer", 
                "bot_personality" : "extrovertido", 
                "patient_problem" : "ansiedad",
                "patient_country" : "España",
                "context" : [
                    {"role":"user", "content":"Hola"},
                    {"role":"assistant","content":"Hola, encantado de saludarte."},
                    {"role":"user", "content":"¿puedes ayudarme?"}]
            }
        }

# Data schema for Piscobotica Chat Bot Response
class ChatBotResponse(BaseModel):
    bot_response: str


# Data schema for Psicobotica simulated patient input, with context
class SimulPatientCompletionInput(BaseModel):
    userid: str = Field(min_length=1)  # User ID for permissions, logging, billing, etc.
    patient_name: str = Field(min_length=1) # Patient data
    patient_age: Optional[str] = None  # Patient data
    patient_gender: Optional[str] = None  # Patient data
    patient_diagnosis: Optional[str] = None 
    patient_problem: Optional[str] = None 
    patient_personality: Optional[str] = None 
    patient_country: Optional[str] = None
    bot_mode: Optional[str] = None
    bot_temp: Optional[float] = None
    context: List[ChatMessage] # Previous messages
    
    class Config:
        json_schema_extra = {
            "example":{
                "userid": str(uuid4()),
                "patient_name": "Ana",
                "patient_age": "22",
                "patient_gender" : "mujer", 
                "patient_diagnosis" : "ansiedad",   
                "patient_personality" : "introvertida",             
                "patient_problem" : "queja constante",
                "patient_country" : "España",
                "bot_mode" : "succint",
                "bot_temp" : "0",
                "context" : [
                    {"role":"user", "content":"Hola"},
                    {"role":"assistant","content":"Hola, encantado de saludarte."},
                    {"role":"user", "content":"¿puedes ayudarme?"}]
            }
        }


# Data schema for Psicobotica Simulated Patient Response
class SimulPatientResponse(BaseModel):
    patient_response: str


# Data schema for Psicobotica recruitment bot input, with context
class RecruitBotCompletionInput(BaseModel):
    userid: str = Field(min_length=1)  # User ID for permissions, logging, billing, etc.
    bot_role: str = Field(min_length=1) # Bot acting as recruiter or candidate
    bot_mode: Optional[str] = None
    bot_temp: Optional[float] = None
    bot_name: str = Field(min_length=1) 
    bot_approach: Optional[str] = None     
    bot_personality: Optional[str] = None
    cand_name: str = Field(min_length=1) # Candidate's data
    cand_age: Optional[str] = None  
    cand_gender: Optional[str] = None  
    cand_resume: Optional[str] = None  
    cand_personality: Optional[str] = None 
    cand_country: Optional[str] = None
    job_company: str = Field(min_length=1) # Job description data 
    job_title: str = Field(min_length=5) 
    job_desc: str = Field(min_length=10) 
    job_skills: Optional[str] = None
    job_num_questions: str = Field(min_length=1) 
    context: List[ChatMessage] # Previous messages
    
    class Config:
        json_schema_extra = {
            "example":{
                "userid": str(uuid4()),
                "bot_role": "recruiter",
                "bot_mode" : "succint",
                "bot_temp" : "0",
                "bot_name" : "Maria",
                "bot_approach" : "entrevista de selección", 
                "bot_personality" : "seria y formal",
                "cand_name": "Ana",
                "cand_age": "29",
                "cand_gender" : "mujer", 
                "cand_resume" : "programadora con 10 años de experiencia en javascript",
                "cand_personality" : "introvertida",             
                "cand_problem" : "queja constante",
                "cand_country" : "España",
                "job_company" : "Super Software",
                "job_title" : "desarrollador full stack", 
                "job_desc" : "experto en node.js y react para backend y frontend",
                "job_skills" : "perseverancia y atención al detalle",
                "job_num_questions" : "4",
                "context" : [
                    {"role":"user", "content":"Hola"},
                    {"role":"assistant","content":"Hola, encantado de saludarte."},
                    {"role":"user", "content":"¿puedes ayudarme?"}]
            }
        }

# Data schema for Psicobotica Recruitment Bot Response
class RecruitmentBotResponse(BaseModel):
    bot_response: str