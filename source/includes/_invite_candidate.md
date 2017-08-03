# Invite Candidate

When LaunchPad needs to send a candidate to a 3rd party assessment, LaunchPad will send a request to the Assessment Partner’s `invite_candidate` API endpoint. The candidate will then be redirected to the assessment URL provided by the Assessment Partner. Alternatively, an email can be sent to the candidate that contains the third party assessment details.

<h2 id="invite-candidate-request">Request Parameters</h2>

> Sample JSON data body for invite candidate request

```json
{
  "partner": {
    "uuid": "partner_uuid",
    "account_id": "account_id",
    "send_invite": false
  },
  "candidate": {
    "id": "sample_candidate_id",
    "handback_url": "https://launchpad-handback-url.com",
    "first_name": "John",
    "last_name": "Dough",       
    "email": "johndough@pastries.com"
  },
  "assessment": {
    "id": "12345",
    "custom_id": "custom_id",
  },
  "interview": {
    "uuid": "interview_uuid"
  }
}
```

> Sample invite candidate request to assessment partner:

```shell
# assuming that there is a file named body.json
# containing the JSON data

curl -H "Content-Type: application/json" \
  -X POST -u API_KEY: -d @body.json \
  'https://www.partner.com/api/invite_candidate'
```

LaunchPad will send the JSON data with the following contents:

### Partner Object

Parameter   | Type    | Always present? | Description
------------|---------|-----------------|------------
uuid        | String  | **Yes**         | Partner uuid generated by Launchpad
account_id  | String  | No              | Identifies the account used in the Assessment Partner system.
send_invite | Boolean | No              | If set to true, Assessment Partner should send an email inthevite to  candidate's email address. **Default value is false.**

### Candidate Object
> Candidate object request body snippet

```json
{
  #..snip..
  "candidate": {
    "id": "sample_candidate_id",
    "handback_url": "https://launchpad-handback-url.com",
    "first_name": "John",
    "last_name": "Dough",       
    "email": "johndough@pastries.com"
  },
  #..snip..
}
```


Parameter     | Type    | Always present? | Description
--------------|---------|-----------------|------------
id            | String  | **Yes** | Candidate identifier generated by LaunchPad
handback_url  | String  | **Yes** | URL where the candidate will be taken to after completing the third party assessment.
first_name    | String  | No      | Candidate first name. First name will be sent if configured in the assessment.
last_name     | String  | No      | Candidate's last name. Last name will be sent if configured in the assessment.
email         | String  | No      | Candidate's email. The assessment should be sent to this address. Email address will be sent if configured in the assessment.

### Assessment Object
> Assessment and Interview object request body snippet

```json
{
  #..snip..
  "assessment": {
    "id": "12345",
    "custom_id": "custom_id",
  },
  "interview": {
    "uuid": "interview_uuid"
  }
}
```

Parameter | Type    | Always present? | Description
----------|---------|-----------------|------------
id        | String  | **Yes**         | Identifies an assessment available to an organization. Initially provided by the Assessment Partner via the [list assessment request](#list-assessments)
custom_id | String  | No              | Custom identifier that can be used by the third partyassessment provider.

### Interview Object

Parameter | Type    | Always present? | Description
----------|---------|-----------------|-------------
uuid      | String  | **Yes**         | Interview uuid generated by LaunchPad. Unique identifier of the candidate's assessment session.

<h2 id="invite-candidate-response">Response Parameters</h2>

> Sample expected JSON response for invite candidate request

```json
{
  "partner": {
    "uuid": "partner_uuid",
    "account_id": "account_id"
  },
  "interview": {
    "uuid": "interview_uuid",
    "id": "98765",
    "url": "https://partner.com/testhere",
    "username": "username",
    "password": "password",
    "web_token": "727FFD3A-7C56-45CC-A579-DF93FE0325E9"
  },
  "candidate": {
    "id": "sample_candidate_id"
  },
  "assessment": {
    "id": "12345"
  }
}
```

LaunchPad expects a JSON object with the following contents:

Parameter   | Type    | Required  | Description
------------|---------|-----------|-------------
partner     | Object  | **Yes**   | Contains partner details
interview   | Object  | **Yes**   | Contains interview details
candidate   | Object  | **Yes**   | Contains candidate details
assessment  | Object  | **Yes**   | Contains external assessment details

### Partner Object

Parameter   | Type    | Required  | Description
------------|---------|-----------|------------
uuid        | String  | **Yes**   | Provided by LaunchPad. Unique identifier of the third party assessment provider in LaunchPad.
account_id  | String  | No        | Identifies the account used in the Assessment Partner system.

### Interview Object

> Interview object response snippet

```json
{
  #..snip..
  "interview": {
    "uuid": "interview_uuid",
    "id": "98765",
    "url": "https://partner.com/testhere",
    "username": "username",
    "password": "password",
    "web_token": "727FFD3A-7C56-45CC-A579-DF93FE0325E9"
  },
  #..snip..
}
```

Parameter   | Type    | Required  | Description
------------|---------|-----------|-------------
uuid        | String  | **Yes**   | Provided by LaunchPad on the request body. That same value should be returned in the response.
id          | String  | **Yes**   | Identifies a candidate’s assessment session.
url         | String  | **Yes**   | Assessment URL to redirect the candidate to complete an assessment.
username    | String  | No        | Third party assessment provider username
password    | String  | No        | Third party assessment provider password
web_token   | String  | No        | Third party assessment provider web token

### Candidate Object

> Candidate and assessment object response snippet

```json
{
  #..snip..
  "candidate": {
    "id": "sample_candidate_id"
  },
  "assessment": {
    "id": "12345"
  }
}
```

Parameter   | Type    | Required  | Description
------------|---------|-----------|-------------
id          | String  | **Yes**   | Provided by LaunchPad on the request body. That same value should be returned in the response. Used internally by LaunchPad to identify the candidate

### Assessment Object
Parameter   | Type    | Required  | Description
------------|---------|-----------|-------------
id          | String  | **Yes**   | Provided by LaunchPad on the request body. That same value should be returned in the response. Used internally by LaunchPad to identify the assessment
