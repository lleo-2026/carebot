# Answers

## Task 1 - Incident triage

1. Hospital A - Critical

No AI predictions for a live hospital is a full break in the main service. Doctors are waiting and patients are affected, so I would treat this as the top priority.

2. Internal analytics dashboard - Low

This is annoying for the sales team, but it is internal and not part of patient care. Since it is slow rather than completely down, I would keep it low unless there is some business deadline around it.

3. Hospital B rare X-ray format error - Medium

This is customer-facing and recurring, so it should not be ignored. But it only affects one rare format and normal X-rays still work, so the impact is limited. I would want examples of the failed files, but I would not treat it like a full outage.

4. Hospital C Gateway offline before go-live - High

No one is using it right now because the hospital is closed, so it is not critical yet. Still, go-live is tomorrow morning, so this needs to be handled quickly before it turns into a real outage. If it is still down close to go-live, I would raise it again.

## Task 2 - Communication

### 1. Most likely failure point

The gateway itself looks healthy. It is online, idle, and still getting successful heartbeat checks from the hospital autorouter API.

The important part is that the last scan we received was at 14:15. After that, the logs only show heartbeat checks, not new scans. The scan at 14:12 also finished normally and the result was sent back.

So I would first look before the Carebot gateway, probably at the hospital autorouter or the routing from their side to our gateway. The scans seem to be stuck before they reach us, rather than failing inside our processing.

### 2. What I would ask L1 or the hospital to check

Since we do not have access to the hospital systems, I would ask L1 to get someone on the hospital side to check the autorouter/PACS queue and logs.

The useful things to get are:

- Are the 20 scans stuck in a queue, failed, or marked as sent?
- Any autorouter errors after 14:15?
- Did the Carebot destination change? AE title, IP/hostname, port, or routing rule.
- Send one test X-ray again and give us the exact time plus accession number or StudyInstanceUID.
- Did anything change around 14:15, like firewall, routing rules, PACS restart, or autorouter config?

With a test scan time and identifier, we can check our side again and say clearly whether it reached the gateway or not.

### 3. Email reply to L1

Subject: Re: URGENT: Hospital XYZ - Doctors not receiving AI results

Hi,

I checked the Gateway status and the recent receiver logs for Hospital XYZ.

From our side the Gateway looks healthy. It is online, CPU/RAM are low, and it is still getting successful heartbeat responses from the hospital autorouter API. The last scan we actually received was at 14:15. The last full scan flow I can see was at 14:12, and that one completed normally with the result sent back.

After 14:15 I only see heartbeat checks, not incoming scans. So at the moment this does not look like scans are reaching Carebot and failing during processing. It looks more like the new scans are not being delivered to the Gateway.

Can you please ask the hospital team to check the autorouter/PACS side urgently?

Things to check:

- Are the ~20 X-rays queued, failed, or marked as sent in the autorouter?
- Are there any errors in the autorouter logs after 14:15 for the Carebot destination?
- Is the Carebot destination still configured with the correct AE title, IP/hostname, and port?
- Please send one test study to Carebot and share the timestamp plus accession number or StudyInstanceUID.
- Please also confirm if there were any routing, firewall, PACS, or autorouter changes around 14:15.

Once we have a test study and timestamp, I can check immediately whether it arrives on the Gateway.

Best,
Leo
