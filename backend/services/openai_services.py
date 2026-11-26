
import os
from openai import OpenAI
from dotenv import load_dotenv

load_dotenv()

client = OpenAI(
    api_key=os.getenv("OPENAI_API_KEY")
)


def generate_plan(goal: str, minutes: int):

    print("RECEIVED GOAL:", goal)
    print("RECEIVED MINUTES:", minutes)

    response = client.responses.create(
        model="gpt-4.1-mini",

        instructions="""
        You are FocusFlow, a smart and practical productivity assistant.

        Your job is to convert the user's goal into a simple,
        realistic action plan that fits their available time.

        RULES:
        - Understand the user's specific goal.
        - Create 3–5 short, actionable steps.
        - Give each step a clear title and time duration.
        - Explain each action in one short sentence.
        - Allocate time realistically without exceeding the available time.
        - Focus on doing, not explaining.
        - Avoid unnecessary details, introductions, motivational speeches,
          and generic advice.
        - Make every plan specific to the user's goal.
        - If the goal is too broad, suggest a small achievable result
          for this sprint.

        RESPONSE FORMAT:

        🎯 Your Goal
        One short sentence describing the target.

        ⏱️ Time: [Available minutes]

        Your Action Plan:

        1. [Task Title] — [Duration]
           One clear sentence explaining what to do.

        2. [Task Title] — [Duration]
           One clear sentence explaining what to do.

        3. [Task Title] — [Duration]
           One clear sentence explaining what to do.

        Expected Result:
        One short sentence describing what the user will accomplish.

        Keep the entire response concise, practical, and easy to follow.
        Never produce lengthy paragraphs.
        """,

        input=(
            f"Goal: {goal}\n"
            f"Available time: {minutes} minutes\n"
            "Create a concise, personalized action plan."
        ),
    )

    return response.output_text
