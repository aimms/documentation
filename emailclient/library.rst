Introduction
============

The Email Client library provides you with a `API <api.html>`_ to create and send emails from within your model. You can use this library, for instance, to programmatically send emails containing the results of your optimization model to other users in your organization. 

The Email Client library allows creating email message with text and/or HTML body template files on disk, both of which may contain placeholders that will be replaced by the actual text when creating the actual email bodies of an email message. The library also allows you to add attachment, which can be either *file attachments* that are directly visible to the recipient as downloadable files, or *related attachments* that contain, for instance, bitmaps to be displayed in the HTML body of an email that you are creating. 

To be able to actually send emails, you need to specify an STMP server which you are allowed use, in order to deliver the email thus created to the specified recipients. 

Adding the Email Client library to your model
---------------------------------------------

The Email Client component is provided in the form of a library :token:`EmailClient` in the AIMMS Library Repository, which is accessible from within the Library Manager within your model. After selecting the :token:`EmailClient` library from the Library Manager, it will be downloaded from the AIMMS Library Repository, and added to your model.

To add the Email Client library to your model, open the **Library Manager** from the **File** menu, and click the **Add Library from Repository** button. This will open a dialog displaying all libraries that you can download from the AIMMS Library Repository. Select EmailClient from the list to add the library to your model, or select a specific version to upgrade from a previous version you already installed before. 

This will download the EmailClient library from the library repository, cache it on your local machine and add a reference to it in your AIMMS application. It will not add the library source itself to your model, however. Whenever your app is started, AIMMS will check whether the library is already cached on your computer, and will download it from the AIMMS Library Repository if needed.

Example
-------

The following example shows how to send an email with and attachment. It demonstrates the lower-level native methods used to 

* set the SMTP server to connect to
* create an email message
* add recipients
* set the text and html body from templates and placeholders
* send the message, and
* close the email message

    .. code::

        ! Set the STMP server that will actually send the email message
        retval := email::SetServer("smtp.company.com", 25, MCConnectionType: email::ConnectionTypeStartTLS);

        ! Create the email and set the recipient
        retval := email::NewMail("Test mail", "User Support", "support@company.com", messageId);
        retval := email::AddRecipientTo(messageId, "Joe User", "Joe.User@usercompany.com");

        ! Define values for placeholders to replace in the templates used to create the actual email message
        PlaceHolderValues := data { LICENSEE: "Joe User", LICENSENUMBER: "1.2.3.4", ACTIVATIONCODE: "abcde-abcde-abcde-abcde-abcde" };

        ! Create the text and HTML body of the email message from templates and placeholder values
        retval := email::SetMessageFromFile(messageId,"Template/license.txt", "Template/license.html", PlaceHolderValues);
        
        ! Add bitmaps contained in HTML body as related attachments
        retval := email::AddRelatedAttachment(messageId,"Template/license_files/image001.jpg", "image001.jpg");
        retval := email::AddRelatedAttachment(messageId,"Template/license_files/image002.png", "image002.png");
        retval := email::AddRelatedAttachment(messageId,"Template/license_files/image003.png", "image003.png");
        retval := email::AddRelatedAttachment(messageId,"Template/license_files/image004.png", "image004.png");
        retval := email::AddRelatedAttachment(messageId,"Template/license_files/image005.png", "image005.png");
        
        ! Add a file attachment to the email message
        retval := email::AddFileAttachment(messageId,"Template/license_files/license_agreement.pdf");

        ! Sent the email via the specified SMTP server
        retval := email::SendMail(messageId, ErrorMessage);

        ! Close the mail message
        retval := email::CloseMail(messageId);

