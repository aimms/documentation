Information security for the AIMMS AI-powered features
============================================================================

This page describes how AIMMS governs and secures the AI-powered features available in its products (SENSAI, SENSAI Pro, SENSAI Apps, SENSAI Data Ready). It complements the existing :doc:`AIMMS Cloud Platform (Azure) <cloud-platform-azure>` and :doc:`AIMMS Developer <aimms-software>` information security pages, which cover the underlying platform; this page covers what is specific to the AI-powered features running on top of it.

Provider status and scope
-------------------------
* AIMMS is the provider of its AI-powered features within the meaning of the EU Artificial Intelligence Act (Regulation (EU) 2024/1689); the customer is the deployer.
* The underlying language models are supplied by Microsoft Azure OpenAI, acting as a sub-processor. AIMMS remains accountable for how each feature behaves and how customer data is handled.
* AI-powered features are available across SENSAI, SENSAI Pro, SENSAI Apps and SENSAI Data Ready. All are opt-in and disabled by default.

Risk classification
-------------------
* Each AI-powered feature is formally assessed against the EU AI Act's risk tiers, following AIMMS's documented classification methodology.
* **Current classification: limited risk.** No AIMMS AI-powered feature is classified as prohibited (Article 5) or high-risk (Article 6 / Annex III): none performs biometric identification, social scoring, or makes autonomous decisions about an individual's access to employment, credit, essential services, education, law enforcement or justice. They operate as B2B decision-support tools for business customers.
* As limited-risk systems, they are subject to the Article 50 transparency obligations: users are informed they are interacting with an AI system, and AI-generated text/content is identifiable as such in line with applicable Commission guidance.
* Classification is reviewed annually and on any material change to a feature, its intended use, or the underlying model provider.

Data processing
---------------
* **Customer data:** under the AIMMS Software License Agreement, "Customer Data" is defined as any data or information the customer or its authorized users upload, submit, transmit or otherwise make available to AIMMS through or in connection with the Software or Service. For Customer Data, the customer is the data controller and AIMMS acts as the processor.
* AI-powered features run as isolated, containerized services inside AIMMS's own Azure environment. The specific data processed depends on the feature: informational assistants send only the user's question and a session identifier; agentic features process what is needed to carry out the user's explicit instruction.
* Customer data is **not** used to train, retrain or fine-tune any AI model. All inference is confined to a contracted, no-training Microsoft Azure OpenAI deployment; Microsoft does not use submitted data to train its own or OpenAI's models, and does not share it with third parties.
* AI-powered features are not designed to process personal data. Customers and users are asked not to submit personal data or special categories of personal data.
* Chat/session interactions and operational telemetry are retained for a maximum of six months, after which they are automatically deleted or irreversibly anonymized.
* Telemetry is recorded at the customer (organization) level only; no individual user identifier is captured or stored.
* AI processing takes place within the same geography as the customer's AIMMS tenant (EU stays in EU, US stays in US).

Security controls
-----------------
* Access to data and actions is scoped to the invoking user's own existing permissions; there is no privilege escalation through an AI-powered feature.
* Agentic actions are logged (initiating user, timestamp, action, outcome), and the log is retained for six months and cannot be altered by users.
* Agentic actions run only on user instruction; where reasonable, changes made can be reverted.
* Encryption in transit and at rest, and secrets/credential management via secure vaults, follow the same standards as the rest of the AIMMS Azure platform (see the :doc:`Cloud Platform security page <cloud-platform-azure>`).
* Guardrails and secure-development practices address AI-specific risks referenced in the OWASP GenAI/LLM Top 10 (prompt injection, sensitive-information disclosure, data/model poisoning, excessive agency, and related risks).
* Every AI-powered feature has a **kill switch**: AIMMS can disable it immediately at the tenant level if required, independent of a customer's own ability to enable or disable a feature they've opted into.

Governance
----------
* Every AI-powered feature is assessed against AIMMS's internal AI governance checklist before it reaches production, covering intended use, data processing, architecture and security, guardrails, monitoring, and human oversight.
* AI-powered features are validated using automated evals — tests designed specifically to handle the probabilistic nature of AI systems — run before release and on an ongoing basis.
* AIMMS maintains formal EU AI Act classification documentation and an AI-specific information security risk assessment, both reviewed on a defined cycle and upon material change.
* A responsible owner is assigned to each AI-powered feature, with a clear escalation path for issues.

Certifications and audits
-------------------------
* AIMMS maintains an ISO 27001-certified Information Security Management System; the certificate and Statement of Applicability are available on request.
* A SOC 2 Type I report is available under NDA; a SOC 2 Type II audit is underway.
* The underlying Microsoft Azure infrastructure carries its own independent certifications (ISO 27001, SOC 2, and others), covered in the :doc:`Cloud Platform security page <cloud-platform-azure>`.

Your controls as a customer
---------------------------
* AI-powered features are opt-in and disabled by default; consent can be withdrawn at any time by contacting AIMMS User Support, ending processing going forward.
* Additional AI-specific terms apply — see the `AIMMS AI Systems Terms of Use <https://scnavigator-manual.aimms.com/sc-navigator/how_to_use/terms_of_use/index.html>`_.
* For a deeper technical review — a security questionnaire, procurement review, or your own AI Act assessment — contact your AIMMS account team for the feature-specific technical overview document.

This page covers what applies across AIMMS's AI-powered features generically. Feature-specific technical detail (e.g. for SENSAI Pro or SENSAI Data Ready) is available on request from your AIMMS account team.

.. spelling:word-list::

    SENSAI
    agentic
    deployer
    evals
    OWASP
    GenAI
    retrain
