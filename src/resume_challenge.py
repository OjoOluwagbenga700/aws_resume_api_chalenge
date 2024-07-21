import json
import boto3
from boto3.dynamodb.conditions import Key

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('Resumes')

def format_json_response(item):
    return {
        "resume": item['resume'],
        "basics": {
            "location": {
                "address": item['basics']['location']['address'],
                "city": item['basics']['location']['city'],
                "countryCode": item['basics']['location']['countryCode'],
                "postalCode": item['basics']['location']['postalCode'],
                "region": item['basics']['location']['region']
            },
            "name": item['basics']['name'],
            "phone": item['basics']['phone'],
            "summary": item['basics']['summary']
            
        },
        
        "jobExperience": {
            "company": item['jobExperience']['company'],
            "position": item['jobExperience']['position'],
            "startDate": item['jobExperience']['startDate'],
            "endDate": item['jobExperience']['endDate'],
            "responsibilities": item['jobExperience']['responsibilities']
        },
        "certification": {
            "name": item['certification']['name'],
            "institution": item['certification']['institution'],
            "date": item['certification']['date'],
            "credlyLink": item['certification']['credlyLink']
        },
        
            "name": item['certification']['name'],
            "institution": item['certification']['institution'],
            "date": item['certification']['date'],
            "credlyLink": item['certification']['credlyLink']

    }
 

def lambda_handler(event, context):
    try:
        response = table.get_item(
            Key={
                'resume': 'ojo_samuel_resume'
            }
        )
        item = response['Item']
        formatted_response = format_json_response(item)
        return {
            'statusCode': 200,
            'headers': {
                'Content-Type': 'application/json'
            },
            'body': json.dumps(formatted_response, indent=4)
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }