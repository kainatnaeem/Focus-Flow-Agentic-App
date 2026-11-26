from pydantic import BaseModel

class RequestPlan(BaseModel):
    goal:str
    minutes:int