# encoding: utf-8

control "V-52305" do
	title "The DBMS must support organizational requirements to encrypt information stored in the database, and information extracted or derived from the database and stored on digital media."
	desc "When data is written to digital media, such as hard drives, mobile computers, external/removable hard drives, personal digital assistants, flash/thumb drives, etc., there is risk of data loss and/or compromise. 

An organizational assessment of risk guides the selection of media and associated information contained on that media requiring restricted access. Organizations need to document in policy and procedures the media requiring restricted access, individuals authorized to access the media, and the specific measures taken to restrict access. 

Fewer protection measures are needed for media containing information determined by the organization to be in the public domain, to be publicly releasable, or to have limited or no adverse impact if accessed by other than authorized personnel. In these situations, it is assumed the physical access controls where the media resides provide adequate protection. 

As part of a defense-in-depth strategy, the organization considers routinely encrypting information at rest on selected secondary storage devices. The decision whether to employ cryptography is the responsibility of the information owner/steward, who exercises discretion within the framework of applicable rules, policies, and law. The selection of the cryptographic mechanisms used is based upon maintaining the confidentiality and integrity of the information.

The strength of mechanisms is commensurate with the classification and sensitivity of the information.

Information at rest, when not encrypted, is open to compromise from attackers who have gained unauthorized access to the data files.false"
	impact 0.5
	tag "check": "Review DBMS settings to determine whether data stored on the database is encrypted according to organizational requirements. If not, this is a finding.

Determine whether the Oracle DBMS software is at version 11.2.0.4 with the January 2014 CPU (or above).  If it is not, this is a finding."
	tag "fix": "Deploy Oracle 11.2.0.4 with the January 2014 CPU patch. Configure cryptographic functions to use FIPS 140-2-compliant algorithms and hashing functions.

Configure the DBMS to encrypt data at rest according to the requirements of the organization.

The strength requirements are dependent upon data classification.

For unclassified data, where cryptography is required:
AES 128 for encryption
SHA 256 for hashing

NSA has established the suite B encryption requirements for protecting National Security Systems (NSS) as follows:

AES 128 for Secret
AES 256 for Top Secret
SHA 256 for Secret
SHA 384 for Top Secret

National Security System is defined as:
(OMB Circular A-130) Any telecommunications or information system operated by the United States Government, the function, operation, or use of which (1) involves intelligence activities; (2) involves cryptologic activities related to national security; (3) involves command and control of military forces; (4) involves equipment that is an integral part of a weapon or weapons system; or (5) is critical to the direct fulfillment of military or intelligence missions, but excluding any system that is to be used for routine administrative and business applications (including payroll, finance, logistics, and personnel management applications).

There is more information on this topic in the Oracle Database 11.2g Advanced Security Administrator's Guide, which may be found at http://docs.oracle.com/cd/E11882_01/network.112/e40393.pdf

Because of changes in Oracle's licensing policy, it is no longer necessary to purchase Oracle Advanced Security to use network encryption and advanced authentication.

FIPS 140-2 can be downloaded from http://csrc.nist.gov/publications/PubsFIPS.html#140-2"

	# Write Check Logic Here

end