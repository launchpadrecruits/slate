# Assessment Status
Assessment Partner have 2 ways to inform LaunchPad of a candidates status in the third party assessment process:

* Callback - Assessment Partner will automatically send updates to LaunchPad as the candidate moves along the assessment process.
* Polling - LaunchPad will send a GET request to the Assessment Partner's endpoint with a single query parameter `partner_interview_id`. After which the Assessment Partner's response should contain the candidate's assessment status

## Callback
The Assessment Partner will send a callback to notify LaunchPad where the candidate is in terms of the third party assessment process.