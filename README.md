# ml-deployment

The contents are from https://testdriven.io/blog/fastapi-machine-learning/

## To create venv
```bash
python3 -m venv env
```
## To activate the env
```bash 
source env/bin/activate
```

## Start the app
```bash
uvicorn main:app --reload --workers 1 --host 0.0.0.0 --port 8008
```

## Using docker instead
```bash
    docker buildx create --use
    docker buildx build --platform linux/amd64 -f docker/Dockerfile.base -t $(BASE_IMAGE) --push .
```

### Command detail
So, we defined the following settings for Uvicorn:
```
    --reload enables auto-reload so the server will restart after changes are made to the code base. \n
    --workers 1 provides a single worker process.
    --host 0.0.0.0 defines the address to host the server on.
    --port 8008 defines the port to host the server on.
    main:app tells Uvicorn where it can find the FastAPI ASGI application -- i.e., "within the the 'main.py' file, you'll find the ASGI app, app = FastAPI().
```