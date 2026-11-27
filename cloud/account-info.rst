.. _cloud-account-info:

Retrieving Account Information
==============================

The AIMMS PRO library offers procedures that let your app find out where it is running and what the characteristics of your AIMMS Cloud Platform account are. This is useful, for instance, when your app has to construct URLs that point to your own Cloud account, or when it has to adapt its behavior to the number of solver sessions it can run in parallel.

Checking whether your app runs on the Cloud
-------------------------------------------

.. code-block:: aimms

    pro::management::IsRunningOnCloud()

Returns ``1`` when the current session runs on the AIMMS Cloud Platform, and ``0`` otherwise. A desktop session launched from the AIMMS Cloud Platform is considered *not* to be running on the AIMMS Cloud Platform.

This procedure requires AIMMS PRO 2.28 or higher. On older versions it raises an error.

Retrieving the account characteristics
--------------------------------------

.. code-block:: aimms

    pro::management::RetrieveAccountInfo(infoKey, infoValue)

Retrieves a set of key-value pairs that describe your AIMMS Cloud Platform account.

**Arguments**

``infoKey`` (output)
    A set that, on return, contains one element for each available key.

``infoValue`` (output)
    A string parameter indexed over ``infoKey`` that, on return, contains the value for each key.

**Available keys**

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - Key
     - Value
   * - ``DNS_NAME``
     - The DNS name of your AIMMS Cloud Platform account, i.e. the host name in the URL of your Portal (for example ``myaccount.aimms.cloud``).
   * - ``REGION``
     - The Azure region your account is hosted in, for example ``Westeurope`` or ``Eastus``.
   * - ``CONCURRENT_USERS``
     - The number of concurrent users allowed by your subscription.
   * - ``CONCURRENT_SOLVES``
     - The number of concurrent solver sessions allowed by your subscription.
   * - ``SOLVER_LICENSES``
     - The solver licenses available to your account.
   * - ``TASK_LICENSES``
     - The task licenses available to your account.
   * - ``CUSTOMIZATION_PROFILE``
     - The name of the customization profile assigned to your account.

New keys may be added in future releases, so do not rely on the number or order of the elements in ``infoKey``.

**Requirements**

``pro::management::RetrieveAccountInfo`` requires AIMMS PRO 2.39 or higher and AIMMS 4.82 or higher. On older PRO versions it raises an error. The ``REGION`` key is available from AIMMS PRO 25.3 onwards.

The procedure queries the PRO server, so it only works in a session that is connected to the AIMMS Cloud Platform, such as a WebUI app launched from the Portal or a server-side solver session.

**Example**

The example below retrieves the DNS name of the account the app is running on.

.. code-block:: aimms

    Set AccountInfoKeys {
        Index: aik;
    }
    StringParameter AccountInfoValues {
        IndexDomain: aik;
    }
    StringParameter AccountDnsName;

    Procedure GetAccountDnsName {
        Body: {
            pro::management::RetrieveAccountInfo(AccountInfoKeys, AccountInfoValues);
            if 'DNS_NAME' in AccountInfoKeys then
                AccountDnsName := AccountInfoValues('DNS_NAME');
            endif;
        }
    }
