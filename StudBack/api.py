from fastapi import APIRouter, Request, Depends

from dependencies import get_db
from services import schema
from graphql import graphql

router = APIRouter()


@router.post("/graphql")
async def graphql_api(request: Request):
    data = await request.json()
    result = ""
    try:
        query = data.get("query")
        variables = data.get("variables")
        result = graphql(schema, query, variable_values=variables)
    except Exception as e:
        print("Error:", e)
    return {
        "data": result.data if result else None,
        "errors": [str(error) for error in result.errors] if result and result.errors else None
    }
