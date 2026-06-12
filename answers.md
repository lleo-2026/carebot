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

### Most likely failure point

The gateway itself looks healthy. It is online, idle, and still getting successful heartbeat checks from the hospital autorouter API.

The important part is that the last scan we received was at 14:15. After that, the logs only show heartbeat checks, not new scans. The scan at 14:12 also finished normally and the result was sent back.

So I would first look before the Carebot gateway, probably at the hospital autorouter or the routing from their side to our gateway. The scans seem to be stuck before they reach us, rather than failing inside our processing.
