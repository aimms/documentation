Email Client API
================

Server Management
------------------

.. js:function::  email::SetServer(_HostName,_Port,_ConnectionType,_AuthType,_UserName,_Password,_OAuth2Token,_CheckCertificate)

    Sets the STMP server to use for sending email messages through the js:func:`email::SendMail` function. Returns 1 if successful, or 0 otherwise.
    
    :param _HostName: hostname of the SMTP server to which to connect to.
    :param _Port: IP port on which the SMTP server will listen for incoming SMTP connections (typically 25 or 587)
    :param _ConnectionType: optional argument specifying the type of connection (clear text (default), StartTLS or TLS), you can use the constants defined in the :token:`DLLInterface/Connection Types` section to specify the connection type.
    :param _AuthType: optional argument specifying the type of authentication required for connecting to the SMTP server (default None). You can use the constants defined in the :token:`DLLInterface/Authentication Types` section to specify the required authentication type.
    :param _UserName: optional argument specifying the username to use when connecting to the STMP server
    :param _Password: optional argument specifying the password to use when connecting to the STMP server
    :param _OAuth2Token: optional argument specifying the OAuth2 token to use when connecting to the STMP server
    :param _CheckCertificate: optional argument specifying whether to verify the certificate returned by the server when connecting via StartTLS or TLS connection type.

.. js:function::  email::NewMail(_Subject,_Name,_Address,_MessageId)

    Creates a new mail message object, to which you can add information and eventually send via the specified SMTP server. Returns 1 if successful, or 0 otherwise.
        
    :param _Subject: subject of the email message
    :param _Name: name of the sender of the email message
    :param _Address: email address of the sender
    :param _MessageId: output argument holding the message id of the mail message object being created
   
.. js:function::  email::AddRecipientTo(_MessageId,_Name,_Address)

    Adds a *To* recipient to the given email message. Returns 1 if successful, or 0 otherwise.
    
    :param _MessageId: message id of the email message
    :param _Name: name of the recipient
    :param _Address: email address of the recipient
   
.. js:function::  email::AddRecipientCc(_MessageId,_Name,_Address)

    Adds a *Cc* recipient to the given email message. Returns 1 if successful, or 0 otherwise.
    
    :param _MessageId: message id of the email message
    :param _Name: name of the recipient
    :param _Address: email address of the recipient
    
.. js:function::  email::AddRecipientBcc(_MessageId,_Name,_Address)

    Adds a *Bcc* recipient to the given email message. Returns 1 if successful, or 0 otherwise.
    
    :param _MessageId: message id of the email message
    :param _Name: name of the recipient
    :param _Address: email address of the recipient
    
.. js:function::  email::SetMessageFromFile(_MessageId,_TextBodyFile,_HTMLBodyFile,_PlaceHolders)

    Creates the text and HTML bodies based on templates, and a parameter containing replacement text for placeholders contained in the template files. Returns 1 if successful, or 0 otherwise.
    
    :param _MessageId: message id of the email message
    :param _TextBodyFile: the file path for the template used for generating the text body of the email message. When left empty, no text body will be generated. 
    :param _HTMLBodyFile: the file path for the template used for generating the HTML body of the email message. When left empty, no HTML body will be generated. 
    :param _PlaceHolders: 1-dimensional string parameter, mapping placeholder keys to replacement values.
    
.. js:function::  email::AddRelatedAttachment(_MessageId,_Path,_Cid)

    Adds related attachments to the email message, e.g. to add images to the message referred to in the HTML body of the message. To add a related attachment in the HTML body,
    you should specify :token:`cid:<_Cid>` for the :token:`src` attribute, where :token:`<_Cid>` is the value pass through the :token:`_Cid` argument. Returns 1 if successful, or 0 otherwise.
   
    :param _MessageId: message id of the email message
    :param _Path: file path to the attachment to add to the email message.
    :param _Cid: id of the attachment used in the HTML body to refer to the attachment.

.. js:function::  email::AddFileAttachment(_MessageId,_Path)

    Adds a file attachment to the email message. Returns 1 if successful, or 0 otherwise.
    
    :param _MessageId: message id of the email message
    :param _Path: file path to the attachment to add to the email message.
    
.. js:function::  email::SendMail(_MessageId,_ErrorMessage,_SendToFile)

    Sends the email message via the SMTP server specified thru the :js:func:`email::SetServer` function. Returns 1 if successful, or 0 otherwise.
    
    :param _MessageId: message id of the email message
    :param _ErrorMessage: output string argument holding the error message when the function call fails.
    :param _SendToFile: optional argument to specify whether the message created will be saved in a file :token:`mail.dump` instead of being sent to the specified SMTP server (default 0). Useful for debugging the generated email message.

.. js:function::  email::CloseMail(_MessageId)

    Deletes the internal email message object. After call this function the email message can no longer be used.
    
    :param _MessageId: message id of the email message

