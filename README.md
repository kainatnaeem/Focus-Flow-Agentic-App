# Focus Flow – Agentic AI App

A simple AI-powered goal planning application built with Flutter, FastAPI, and OpenAI.

Focus Flow allows users to enter a goal and receive an AI-generated plan. The Flutter application communicates with a FastAPI backend, which sends the user's goal to OpenAI and returns the generated plan.

## Tech Stack

**Frontend**
- Flutter
- Dart
- Cubit (State Management)

**Backend**
- Python
- FastAPI
- OpenAI API
- Pydantic

## Project Architecture

The project is divided into two independent parts:

```text
Focus-Flow-Agentic-App/
│
├── frontend/          # Flutter Application
│   ├── lib/
│   ├── test/
│   └── pubspec.yaml
│
├── backend/           # FastAPI Backend
│   ├── routes/
│   ├── schema/
│   ├── services/
│   └── main.py
│
├── .gitignore
└── README.md
```

## How It Works

1. The user enters a goal in the Flutter application.
2. Flutter sends an API request to the FastAPI backend.
3. FastAPI receives and validates the request.
4. The backend sends the goal to OpenAI.
5. OpenAI generates a personalized plan.
6. FastAPI returns the response to Flutter.
7. Flutter displays the generated plan to the user.

## Application Flow

```text
User
  |
  v
Flutter Application
  |
  v
Cubit State Management
  |
  v
API Service
  |
  v
FastAPI Endpoint
  |
  v
OpenAI API
  |
  v
Generated Plan
  |
  v
Flutter UI
```

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/kainatnaeem/Focus-Flow-Agentic-App.git

cd Focus-Flow-Agentic-App
```

### 2. Backend Setup

Navigate to the backend directory:

```bash
cd backend
```

Create a virtual environment:

```bash
python -m venv .venv
```

Activate it on Windows:

```powershell
.venv\Scripts\activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Create a `.env` file in the backend directory:

```env
OPENAI_API_KEY=your_openai_api_key
```

Start the FastAPI server:

```bash
uvicorn main:app --reload
```

FastAPI documentation:

```text
http://127.0.0.1:8000/docs
```

### 3. Flutter Setup

Open another terminal and navigate to the frontend:

```bash
cd frontend
```

Get Flutter dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

**Note:** Configure the API base URL in the Flutter API service according to your development environment.

## Learning Objectives

This project was developed to practice and understand:

- Connecting a Flutter application with a Python backend.
- Building REST API endpoints using FastAPI.
- Integrating the OpenAI API into an application.
- Sending and receiving API requests and responses.
- Managing application state using Cubit.
- Separating frontend and backend responsibilities.
- Handling environment variables and API credentials.

## Project Status

This is a small learning project focused on understanding Flutter-to-FastAPI communication and OpenAI integration.

More features and improvements can be added in the future.

---

**Developer:** Kainat Naeem

**GitHub:** [kainatnaeem](https://github.com/kainatnaeem)