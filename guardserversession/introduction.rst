Introduction
=============================================

Thanks to extensive checking and clear reporting of incidents; end-users can handle several incidents themselves.
For other incidents, they may need to turn to the specialists in their team; 
asking these specialists questions about the incidents similar to the following:

#.  `Do you know, why I was not able to read the data?`

    The causes are several, for instance: it might be a reconfiguration of the database, a broken internet connection, or something else entirely.

    The specialist that helps the end-user with this question, may very well benefit from clear error messages.

#.  `Do you know, why I had to wait a lot longer before the solution appeared?`

    Again, the causes are several, for instance: slow internet connection used to obtain data, 
    the solution algorithm needed significantly more time for this instance or something else entirely.

    The specialist that helps the end-user with this question, may very well benefit from profiling information.

#.  `I cannot explain the results I'm now seeing. Can you?`

    Such a question may very well be countered with: 

    #.  What have you done, my friend?

    #.  My friend, would you mind sharing the data, such that I can see for myself?

    The specialist that helps the end-user with this question may very well benefit from:

    #.  a log of the actions taken by the end-user, or

    #.  a case file containing a copy of the data the end-user saw.

Let's call the error and profiling information, the action log, and the case file together, the session history.
The purpose of sharing the session history is to reduce the time and effort for resolving those incidents that occurred
during the session and were not handled by the end-user.

The information flow around the application now looks as follows:

.. image:: images/210319_Guardserversession_v2.jpg
    :align: center



Library purpose
------------------------------

The ``GuardServerSession`` library, with prefix ``gss``, is designed, amongst others, to work with session histories.
This library can be discussed from the perspective of internal mechanisms, or from the perspective of integration:

#.  The interaction of stakeholders with the pages of the library:

    #.  :doc:`The incident reporting by end users<gss-ui-for-end-users>`

    #.  :doc:`The incident information management for specialists<gss-ui-for-specialists>`

#.  Mechanisms and provided functions:

    #.  :doc:`Error handling<errors-as-data>`: how errors are turned into data and how this data, together with profiling data, flows through this library. 
    
    #.  :doc:`Logging<logging>`: to generate logs for the application using ``GuardServerSession`` library.

#.  Integration:

    #.  :doc:`Integration instructions<integrate-gss-server-job>`:  to integrate the ``GuardServerSession`` library with your application, 
        in particular how to adapt the delegation to server session.

    #.  :doc:`UI for end users<install-gss-ui-for-end-users>`: to build a user interface for end-users.

    #.  :doc:`UI for specialists<install-gss-ui-for-specialists>`: to build a user interface for specialists.



.. tip:: 
    The course `Error Handling <https://aimms.getlearnworlds.com/course/error-handling>`_  is an extensive walk through of how to handle errors.






 





