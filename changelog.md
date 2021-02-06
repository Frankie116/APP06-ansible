BRANCH "master" 
Changelog-001
    Initial code generated from template: https://github.com/Frankie116/
    APP05-wordpress-lb


Changelog-002
    Refactored code
    Updated readme

Changelog-003
    Moved ansible-master and slave servers to the public subnet so admin can use visual code to manage them easier.
    (It as a bit tricky to connect to them via a jumpbox using visual code. So, moved due to time constraints)

    deleted:    02a-ec2-ami.tf
    modified:   02b-ec2-jumpbox.tf
    modified:   04b-sg-rules-server.tf
    modified:   README.md
    modified:   changelog.md
    modified:   outputs.tf

    Untracked files:
    02a-ec2-ansible.tf
    02a-ec2-server.tf
    06d-route53-record-ansible.tf
    06d-route53-record-lb.tf
    06d-route53-record-server.tf