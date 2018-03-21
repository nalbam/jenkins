import jenkins.model.*
import hudson.security.*

def env = System.getenv()

def jenkins = Jenkins.getInstance()

jenkins.setSecurityRealm(new HudsonPrivateSecurityRealm(false))

//jenkins.setAuthorizationStrategy(new GlobalMatrixAuthorizationStrategy())

jenkins.setCrumbIssuer(new DefaultCrumbIssuer(true))

Set<String> agentProtocolsList = ['JNLP4-connect', 'Ping']
jenkins.setAgentProtocols(agentProtocolsList)

def user = jenkins.getSecurityRealm().createAccount(env.JENKINS_USER, env.JENKINS_PASS)
user.save()

jenkins.getAuthorizationStrategy().add(Jenkins.ADMINISTER, env.JENKINS_USER)

jenkins.save()
