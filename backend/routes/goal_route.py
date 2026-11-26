from fastapi import APIRouter
from schema.goal_schema import RequestPlan
from services.openai_services import generate_plan
router = APIRouter()

@router.post("/generate-plan")
def create_plan(request:RequestPlan):
    plan = generate_plan(request.goal, request.minutes)
    return {"plan":plan}