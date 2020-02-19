# Zoom Link Callback

```shell
https://partner-url.com/callback
```

If this feature is enabled, LaunchPad will send a callback to the Partner system as soon as the Zoom link is available.
Using the Zoom link would allow users to access the assessment directly skipping the LaunchPad interface

## Request

> Sample JSON data body for the Zoom link callback

```json
{
{
    "candidate": {
        "id": "cnd_chuvacheness123",
        "first_name": "harry",
        "last_name": "potter",
        "email": "hpotter@hogwarts.com",
        "custom_invite_id": "123test"
    },
  
    "interview": {
        "start_time": "2018-01-24T14:45:00.000Z",
        "end_time": "2018-01-24T15:15:00.000Z",
        "duration": "30",
        "join_url": "https://launchpadrecruitsapp.com/live_candidate/asdbaedasda",
        "start_url": "https://launchpad.zoom.us/s/331305421?zak=eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjbGllbnQiLCJ1aWQiOiI4V...",
        "id": "123"
    },
 
    "metadata": {
        "timestamp": "2018-01-24T15:25:00.000Z"
    }
}
```

### Candidate Object
> Candidate object request body snippet

```json
{
    #..snip..
    "candidate": {
        "id": "cnd_ljdfhalswrhw3o21312",
        "email": "hpotter@hogwarts.com",
        "custom_invite_id": "123test"
    },
	#..snip..
}
```

Parameter       | Type    | Always present? | Description
----------------|---------|-----------------|------------
id              |String   | **Yes**         |Identifies the candidate in LaunchPad
email           |String   | **Yes**         |Email address of the candidate
custom_invite_id|String   | **Yes**         |Custom identifier for the invite request provided by the partner

### Interview Object
> Interview object request body snippet

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
start_time      |String   | **Yes**         |Start time of the interview in UTC <br>**2018-01-24T14:45:00.000Z**
end_time        |String   | **Yes**         |End time of the interview in UTC <br>**2018-01-24T15:15:00.000Z**
duration        |String   | **Yes**         |Duration of the interview in minutes
id              |String   | **Yes**         |Identifies the candidate in LaunchPad
first_name      |String   | **Yes**         |First name of the candidate
last_name       |String   | **Yes**         |Last name of the candidate
email           |String   | **Yes**         |Email address of the candidate
custom_invite_id|String   | **Yes**         |Custom identifier for the invite request provided by the partner

### Metadata Object
> Metadata object request body snippet

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
