# Update Candidate
When a candidate's email, first name, or last name has been update in LaunchPad, LaunchPad will send a PUT request to the Assessment Partner's update candidate endpoint

<h2 id="update-candidate-request-content">Request Content</h2>
Parameter       | Type    | Required  | Description
----------------|---------|-----------|-------------
partner         | Object  | **Yes**   | Partner details
candidate       | Object  | **Yes**   | Candidate details.

<h3 id="update-candidate-partner-object">Partner Object</h3>

Parameter           | Type    | Required  | Description
--------------------|---------|-----------|------------
uuid                | String  | **Yes**   | Provided by LaunchPad. Unique identifier of the third party assessment provider in LaunchPad.
account_id          | String  | No        | Identifies the account used in the Assessment Partner system.

<h3 id="update-candidate-candidate-object">Partner Object</h3>
Parameter     | Type    | Required  | Description
--------------|---------|-----------|------------
candidate_id  | String  | **Yes**   | Identifies the candidate in LaunchPad.
first_name    | String  | No        | First name of the candidate. First name will be required if configured in the assessment.
last_name     | String  | No        | Last name of the candidate. Last name will be required if configured in the assessment.
email         | String  | No        | The candidate’s email address. The assessment should be sent to this address. Email address will be required if configured in the assessment.

<h2 id="update-candidate-request">Request</h2>

```json
{
  "partner": {
    "uuid": "partner_uuid",
    "account_id": "account_id"
  },
  "candidate": {
    "first_name": "John",
    "last_name": "Dough",       
    "email": "johndough@pastries.com",
    "candidate_id": "candidate_id"
  }
}
```

<h2 id="update-candidate-response">Response</h2>

```json
{
  "partner": {
    "uuid": "partner_uuid",
    "account_id": "account_id"
  },
  "candidate": {
    "first_name": "John",
    "last_name": "Dough",       
    "email": "johndough@pastries.com",
    "candidate_id": "candidate_id"
  }
}
```