import jenkins.model.Jenkins

def env = System.getenv()

def jenkins = Jenkins.getInstance()

// Executors
jenkins.setNumExecutors(3)

// Disable old Non-Encrypted protocols
//HashSet<String> protocols = new HashSet<>(jenkins.getAgentProtocols())
//protocols.removeAll(Arrays.asList("JNLP3-connect", "JNLP2-connect", "JNLP-connect", "CLI-connect"))
//jenkins.setAgentProtocols(protocols)

// Disable remoting
//jenkins.getDescriptor("jenkins.CLI").get().setEnabled(false)

// CSRF Protection
//jenkins.setCrumbIssuer(new hudson.security.csrf.DefaultCrumbIssuer(true))

// Private Realm
jenkins.setSecurityRealm(new hudson.security.HudsonPrivateSecurityRealm(false))

// Create User
def user = jenkins.getSecurityRealm().createAccount(env.JENKINS_USER, env.JENKINS_PASS)
user.save()

// Authorization
jenkins.setAuthorizationStrategy(new hudson.security.FullControlOnceLoggedInAuthorizationStrategy())

// Enable Agent to master security subsystem
//jenkins.getInjector().getInstance(jenkins.security.s2m.AdminWhitelistRule.class).setMasterKillSwitch(false)

jenkins.save()
