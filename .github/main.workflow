workflow "Milestone merged pull requests" {
  on = "pull_request"
  resolves = ["Milestone It"]
}

action "Filter merged" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "merged true"
}

action "Milestone It" {
  uses = "./.github/actions/milestone-it"
  needs = ["Filter merged"]
  secrets = ["GITHUB_TOKEN"]
}

workflow "Add the First-time Contributor label to issues opened by first-time contributors" {
  on = "pull_request"
  resolves = ["First Time Contributor"]
}

action "Filter opened" {
  uses = "actions/bin/filter@0dbb077f64d0ec1068a644d25c71b1db66148a24"
  args = "action opened"
}

action "First Time Contributor" {
  uses = "./.github/actions/first-time-contributor"
  needs = ["Filter opened"]
  secrets = ["GITHUB_TOKEN"]
}
