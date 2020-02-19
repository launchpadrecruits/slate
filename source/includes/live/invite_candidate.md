# Invite Candidate

> Sample invite candidate request to assessment partner:

```shell
https://launchpadrecruitsapp.com/1/live/{interview_id}/invite
```

**`{interview_id}` will need to be replaced by a LaunchPad Interview ID**

When an integration partner wishes to invite a candidate to a Live LaunchPad assessment, it is required to generate an invite link via this API.

## Request (Partner to LaunchPad)

### Sample JSON data body for invite candidate request | Implicit host declaration
> In the example below, adumbledore@hogwarts.com is the host since he is the first reviewer in the array

```json
{
    "candidate": {
        "first_name": "harry",
        "last_name": "potter",
        "email": "hpotter@hogwarts.com",
        "custom_invite_id": "123test",
        "send_email": "true"
    },
 
    "schedule": {
        "start_time": "2018-01-24T14:45:00.000Z",
        "duration": "30"
    },
 
    "reviewers": [
        {
            "email": "adumbledore@hogwarts.com"
        },
        {
            "email": "mmcgonagall@hogwarts.com"
        },
        {
            "email":  "ssnape@hogwarts.com"
        }
    ]
}
```

### Sample JSON data body for invite candidate request | Explicit host declaration
> In the example below, ssnape@hogwarts.com is the host since the host:true is set to his email

```json
{
    "candidate": {
        "first_name": "harry",
        "last_name": "potter",
        "email": "hpotter@hogwarts.com",
        "custom_invite_id": "123test",
		"send_email": "true"
    },
 
    "schedule": {
        "start_time": "2018-01-24T14:45:00.000Z",
        "duration": "30"
    },
 
    "reviewers": [
        {
            "email": "adumbledore@hogwarts.com"
        },
        {
            "email": "mmcgonagall@hogwarts.com"
        },
        {
            "email":  "ssnape@hogwarts.com",
            "host": "true"
        }
    ]
}
```

### Candidate Object
> Candidate object request body snippet

```json
{
    #..snip..
    "candidate": {
        "first_name": "harry",
        "last_name": "potter",
        "email": "hpotter@hogwarts.com",
        "custom_invite_id": "123test"
    },
	#..snip..
}
```

Parameter       | Type    | Always present? | Description
----------------|---------|-----------------|------------
first_name      |String   | **Yes**         |First name of the candidate
last_name       |String   | **Yes**         |Last name of the candidate
email           |String   | **Yes**         |Email address of the candidate
custom_invite_id|String   | **Yes**         |Custom identifier for the invite request provided by the partner
send_email      |String   | **No**          |If set to true, LaunchPad sends the candidate invite email <br><br>if set to false, LaunchPad does not send the candidate invite email <br>Default value is false

### Schedule Object
> Schedule object request body snippet

```json
{
    #..snip..
    "schedule": {
        "start_time": "2018-01-24T14:45:00.000Z",
        "duration": "30"
    },
	#..snip..
}
```

Parameter       | Type    | Always present? | Description
----------------|---------|-----------------|------------
start_time      |String   | **No**          |Start time of the interview in UTC format. <br> `2018-01-24T14:45:00.000Z` <br><br> If the start time is blank, LaunchPad uses the current time relative to the set timezone of the assessment
duration        |String   | **Yes**         |Duration of the interview in minutes


### Reviewers Object
> Reviewers object request body snippet

```json
{
    #..snip..
    "reviewers": [
        {
            "email": "adumbledore@hogwarts.com"
        },
        {
            "email": "mmcgonagall@hogwarts.com"
        },
        {
            "email":  "ssnape@hogwarts.com"
        }
    ]
	#..snip..
}
```

Parameter | Type    | Always present? | Description
----------|---------|-----------------|------------
email     |String   | **Yes**         |Email address of the reviewer in an array format. <br>Up to 8 reviewers. <br>Reviewers need to be an existing LaunchPad user
host      |String   | **No**          |Explicitly define who is the meeting host <br><br>**Host Declaration** <br>Implicit - The first reviewer email in the array is set to be the meeting host <br>Explicit - Using host:true, integrators can set which reviewer email will be the host

## Response (LaunchPad to Partner)

> Sample JSON data body for invite candidate response

```json
{
    "candidate": {
        "id": "cnd_chuvacheness123",
        "first_name": "harry",
        "last_name": "potter",
        "email": "hpotter@hogwarts.com",
        "custom_invite_id": "123test",
		"send_email": "true"
    },
 
    "interview": {
        "start_time": "2018-01-24T14:45:00.000Z",
        "end_time": "2018-01-24T15:15:00.000Z",
        "duration": "30", #minutes
        "candidate_url": "https://launchpadrecruitsapp.com/live_candidate/asdbaedasda",
        "reviewer_url": "https://launchpad.zoom.us/s/331305421?zak=eyJhbGciOiJIDFEwbPiNjUkTejKI1P-Yivwj9fpk...",
        "id": "123",
        "live_meeting_id": "456"
    },
 
    "reviewers": [
        {
            "email": "adumbledore@hogwarts.com"
        },
        {
            "email": "mmcgonagall@hogwarts.com"
        },
        {
            "email":  "ssnape@hogwarts.com"
        }
    ],
 
    "metadata": {
        "timestamp": "2018-01-24T15:25:00.000Z"
    }
}
```

LaunchPad will respond with a JSON data with the following contents:

### Candidate Object
> Candidate object response body snippet

```json
{
    #..snip..
    "candidate": {
        "id": "cnd_chuvacheness123",
        "first_name": "harry",
        "last_name": "potter",
        "email": "hpotter@hogwarts.com",
        "custom_invite_id": "123test"
    },
	#..snip..
}
```


Parameter       | Type    | Always present? | Description
----------------|---------|-----------------|------------
id              |String   | **Yes**         |Identifies the candidate in LaunchPad
first_name      |String   | **Yes**         |First name of the candidate
last_name       |String   | **Yes**         |Last name of the candidate
email           |String   | **Yes**         |Email address of the candidate
custom_invite_id|String   | **Yes**         |Custom identifier for the invite request provided by the partner
send_email      |String   | **Yes**         |If set to true, LaunchPad sends the candidate invite email <br><br>if set to false, LaunchPad does not send the candidate invite email <br>Default value is false

### Interview Object
> Interview object response body snippet

```json
{
    #..snip..
    "interview": {
        "start_time": "2018-01-24T14:45:00.000Z",
        "end_time": "2018-01-24T15:15:00.000Z",
        "duration": "30", #minutes
        "candidate_url": "https://launchpadrecruitsapp.com/live_candidate/asdbaedasda",
        "reviewer_url": "https://launchpad.zoom.us/s/331305421?zak=eyJhbGciOiJIDFEwbPiNjUkTejKI1P-Yivwj9fpk...",
        "id": "123",
        "live_meeting_id": "456"
    },
	#..snip..
}
```

Parameter       | Type    | Always present? | Description
----------------|---------|-----------------|------------
start_time      |String   | **Yes**         |Start time of the interview in UTC
end_time        |String   | **Yes**         |End time of the interview in UTC
duration        |String   | **Yes**         |Duration of the interview in minutes
id              |String   | **Yes**         |Identifies the candidate in LaunchPad
first_name      |String   | **Yes**         |First name of the candidate
last_name       |String   | **Yes**         |Last name of the candidate
email           |String   | **Yes**         |Email address of the candidate
custom_invite_id|String   | **Yes**         |Custom identifier for the invite request provided by the partner

### Reviewers Object
> Reviewers object response body snippet

#### Implicit Host Declaration
```json
{
    #..snip..
    "reviewers": [
        {
            "email": "adumbledore@hogwarts.com"
        },
        {
            "email": "mmcgonagall@hogwarts.com"
        },
        {
            "email":  "ssnape@hogwarts.com"
        }
    ]
	#..snip..
}
```

#### Explicit Host Declaration
```json
{
    #..snip..
    "reviewers": [
        {
            "email": "adumbledore@hogwarts.com"
        },
        {
            "email": "mmcgonagall@hogwarts.com"
        },
        {
            "email":  "ssnape@hogwarts.com",
			"host": "true"
        }
    ]
	#..snip..
}
```

Parameter | Type    | Always present? | Description
----------|---------|-----------------|------------
email     |String   | **Yes**         |Email address of the reviewer in an array format. <br>Up to 8 reviewers. <br>Reviewers need to be an existing LaunchPad user
host      |String   | **No**          |Explicitly define who is the meeting host <br><br>**Host Declaration** <br>Implicit - The first reviewer email in the array is set to be the meeting host <br>Explicit - Using host:true, integrators can set which reviewer email will be the host

### Metadata Object
> Metadata object response body snippet

```json
{
    #..snip..
    "metadata": {
        "timestamp": "2018-01-24T15:25:00.000Z"
    }
	#..snip..
}
```

Parameter    | Type    | Always present? | Description
------------ |---------|-----------------|------------
timestamp    | String  | **Yes**         |Date and time when the event occurred