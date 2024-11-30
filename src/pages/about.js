import * as React from 'react'
import Layout from '../components/layout'

const AboutPage = () => {
  return (
    <Layout pageTitle="About Me">
      <p>This is a page about me.</p>
    </Layout>
  )
}

export const Head = () => <title>About Me</title>

export default AboutPage
