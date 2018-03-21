import jenkins.model.Jenkins
import hudson.security.HudsonPrivateSecurityRealm
import hudson.security.GlobalMatrixAuthorizationStrategy
import hudson.security.csrf.DefaultCrumbIssuer

def env = System.getenv()

def jenkins = Jenkins.getInstance()

// Executors
instance.setNumExecutors(0)

// Private Realm
jenkins.setSecurityRealm(new HudsonPrivateSecurityRealm(false))

// Matrix Authorization
jenkins.setAuthorizationStrategy(new GlobalMatrixAuthorizationStrategy())

// JNLP4
Set<String> agentProtocolsList = ['JNLP4-connect', 'Ping']
jenkins.setAgentProtocols(agentProtocolsList)

// CSRF
jenkins.setCrumbIssuer(new DefaultCrumbIssuer(true))

// Create User
def user = jenkins.getSecurityRealm().createAccount(env.JENKINS_USER, env.JENKINS_PASS)
user.save()

// Admin
jenkins.getAuthorizationStrategy().add(Jenkins.ADMINISTER, env.JENKINS_USER)

jenkins.save()
