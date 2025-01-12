import logging
import os
from fastapi import Request
from starlette.middleware.base import BaseHTTPMiddleware

log_directory = "logs"
log_file_path = os.path.join(log_directory, "api_requests.log")

if not os.path.exists(log_directory):
    os.makedirs(log_directory)

logger = logging.getLogger("api_logger")

file_handler = logging.FileHandler(log_file_path)
file_formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")
file_handler.setFormatter(file_formatter)
logger.addHandler(file_handler)

console_handler = logging.StreamHandler()
console_formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")
console_handler.setFormatter(console_formatter)
logger.addHandler(console_handler)

logger.setLevel(logging.INFO)

class LoggingMiddleware(BaseHTTPMiddleware):
    async def dispatch(self, request: Request, call_next):
        api_key = request.headers.get("X-API-KEY", "No API Key")
        logger.info(f"Request received: {request.method} {request.url} - API Key: {api_key}")
        response = await call_next(request)
        logger.info(f"Request processed: {request.method} {request.url} - API Key: {api_key}")
        return response
