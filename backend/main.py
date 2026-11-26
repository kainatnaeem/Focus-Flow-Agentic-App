from fastapi import FastAPI
from routes.goal_route import router as goal_router
app = FastAPI();

app.get("/")

app.include_router(goal_router)
def home():
    return "welcome to Focus Flow";