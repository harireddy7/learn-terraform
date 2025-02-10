import "./App.css";

function App() {
  return (
    <div className="App">
      <header>
        <h1>Learn Terraform (v0.0.1)</h1>
      </header>
      <hr />
      <main>
        <p>
          Terraform is an open-source tool that helps users build, change, and
          manage infrastructure. It's an <b><i>"infrastructure as code"</i></b> (IaC) tool
          that uses a declarative configuration language to describe the desired
          infrastructure.
        </p>

        <section>
          <h2>What Terraform can do</h2>
          <ul>
            <li>
              <b>Build infrastructure:</b> Define and provision infrastructure
              for the cloud or on-premises
            </li>
            <li>
              <b>Change infrastructure:</b> Update infrastructure in response to
              configuration changes
            </li>
            <li>
              <b>Version infrastructure:</b> Create versions of infrastructure
              to reuse and share
            </li>
            <li>
              <b>Manage infrastructure:</b> Use a consistent workflow to manage
              infrastructure throughout its lifecycle
            </li>
          </ul>
        </section>

        <section>
          <h2>How Terraform works</h2>
          <ul>
            <li>Users define infrastructure using a configuration language</li>
            <li>Terraform generates a plan to reach the desired state</li>
            <li>Terraform runs the plan to provision the infrastructure</li>
          </ul>
        </section>
      </main>
    </div>
  );
}

export default App;
