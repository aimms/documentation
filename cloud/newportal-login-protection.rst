Login Protection for AIMMS PRO Portal
=====================================

The AIMMS PRO Portal authentication service includes built-in protection against
brute-force and credential-stuffing attacks. The authentication server monitors login attempts and applies progressive safeguards when
repeated failures are detected from the same source. Users who sign in normally are not affected.

This page describes how the protection works, what users and administrators may observe, and how to respond.

How It Works
^^^^^^^^^^^^

The system monitors failed login attempts and responds progressively depending on
the volume and pattern of failures detected:

1. **Friction** — After several failed attempts, sign-in responses are deliberately slowed down.
2. **Temporary block** — After continued failures, sign-in is temporarily prevented.
3. **Escalation** — Repeated offenses result in progressively longer block durations.

All blocks are temporary and lift automatically. There are no permanent blocks.

The protection is scoped carefully using a combination of account, user identity,
and source IP address. This means:

- One user's failed attempts do not affect other users.
- Users sharing an office network or VPN are not blocked as a group due to one user's activity.
- The protection cannot be exploited by an attacker to lock out a target user.

What Users May Observe
^^^^^^^^^^^^^^^^^^^^^^

Slower sign-in response
-----------------------

If a user enters the wrong password multiple times in quick succession, they may notice
that the sign-in page takes longer to respond than usual. This is intentional. Waiting
briefly and then retrying with the correct credentials will resolve it.

Temporary inability to login
----------------------------

After a significant number of failed attempts, login may be temporarily unavailable.
The block lifts automatically after a waiting period. Waiting a few minutes before
retrying is usually sufficient.

.. note::

   The error message shown during a block does not indicate which limit was triggered.
   This is by design, to avoid exposing information that could assist an attacker.


Impact on Normal Usage
----------------------

Users who occasionally mistype their password are not affected. The safeguards only
activate after an unusually high number of failures in a short time window.

Automated processes and service accounts that use incorrect credentials may trigger
the protection. If an automated login process begins failing, verify that the
credentials configured for that process are current and correct.
