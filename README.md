<div align="center">
  <h1>Zero One Group UI</h1>
  <p><h3 align="center"></h3></p>
  <a href="https://zero-one-group.com/">Website</a>
  <span>&nbsp;&nbsp;•&nbsp;&nbsp;</span>
  <a href="https://medium.com/zero-one-group">Blog</a>
  <span>&nbsp;&nbsp;•&nbsp;&nbsp;</span>
  <a href="https://twitter.com/zero_one_group">Twitter</a>
  <span>&nbsp;&nbsp;•&nbsp;&nbsp;</span>
  <a href="https://www.linkedin.com/company/zeroonegroup">LinkedIn</a>
  <span>&nbsp;&nbsp;•&nbsp;&nbsp;</span>
  <a href="https://www.npmjs.com/org/01group-ui">npmjs</a>
</div>

<hr>

<div align="center">

[![Contributions](https://img.shields.io/badge/Contributor-Guideline-blue.svg?style=flat-square)](./CONTRIBUTING.md)
[![GitHub contributors](https://img.shields.io/github/contributors/zero-one-group/zog-ui?style=flat-square)](https://github.com/zero-one-group/zog-ui/graphs/contributors)
[![License](https://img.shields.io/github/license/zero-one-group/zog-ui?style=flat-square)][choosealicense]

</div>

<hr>

This repository contains monorepo for React and Flutter UI library provided by us, Zero One Group.

## Introduction

Zero One Group UI (_in short: Zero UI_) is a modular, extensible, styleable React components library from Zero One Group
based on [Ark UI](https://ark-ui.com/) and [Tailwind CSS](https://tailwindcss.com/).

## Contributing

Thank you for considering contributing to this project! If you wish to help, you can learn more about how you can contribute to this project
starting by sending us a message via email to: [info@zero-one-group.com](mailto:info@zero-one-group.com).

Read the [contributor guideline](./CONTRIBUTING.md) for more information.

## UI Components

The UI components leverage [shadcn/ui][shadcn] as their foundation, enhanced with
custom modifications. The notable distinction lies in the styling implementation,
which utilizes [Tailwind Variants][tailwind-variants] for a more flexible approach.

```
- [x] Accordion       : A vertically stacked set of interactive headings that each reveal a section of content.
- [x] Alert           : Displays a callout for user attention.
- [x] Alert Dialog    : A modal dialog that interrupts the user with important content and expects a response.
- [x] Aspect Ratio    : Displays content within a desired ratio.
- [x] Avatar          : An image element with a fallback for representing the user.
- [x] Badge           : Displays a badge or a component that looks like a badge.
- [x] Breadcrumb      : Displays the path to the current resource using a hierarchy of links.
- [x] Button          : Displays a button or a component that looks like a button.
- [ ] Calendar        : A date field component that allows users to enter and edit date.
- [x] Card            : Displays a card with header, content, and footer.
- [ ] Carousel        : A carousel with motion and swipe built using Embla.
- [ ] Chart           : Beautiful charts. Built using Recharts.
- [x] Checkbox        : A control that allows the user to toggle between checked and not checked.
- [x] Collapsible     : An interactive component which expands/collapses a panel.
- [ ] Command         : Fast, composable, unstyled command menu for React.
- [ ] Context Menu    : Displays a menu to the user — such as a set of actions or functions — triggered by a button.
- [x] Dialog          : A window overlaid on either the primary window or another dialog window, rendering the content underneath inert.
- [x] Divider         : A versatile divider component used to create visual separation between content.
- [ ] Drawer          : A drawer component for React.
- [ ] Dropdown Menu   : Displays a menu to the user — such as a set of actions or functions — triggered by a button.
- [ ] Form            : Building forms with React Hook Form and Zod.
- [x] Heading         : A set of headings with responsive font size. Adopted from Catalyst (TailwindUI)
- [x] Hover Card      : For sighted users to preview content available behind a link.
- [x] Input           : Displays a form input field or a component that looks like an input field.
- [ ] Input OTP       : Accessible one-time password component with copy paste functionality.
- [x] Label           : Renders an accessible label associated with controls.
- [x] Pagination      : Pagination with page navigation, next and previous links. Adopted from Catalyst (TailwindUI)
- [x] Popover         : Displays rich content in a portal, triggered by a button.
- [x] Progress        : Displays an indicator showing the completion progress of a task, typically displayed as a progress bar.
- [x] Radio Group     : A set of checkable buttons—known as radio buttons—where no more than one of the buttons can be checked at a time.
- [ ] Resizable       : Accessible resizable panel groups and layouts with keyboard support.
- [ ] Scroll Area     : Augments native scroll functionality for custom, cross-browser styling.
- [ ] Select          : Displays a list of options for the user to pick from—triggered by a button.
- [x] Separator       : Visually or semantically separates content.
- [x] Sheet           : Extends the Dialog component to display content that complements the main content of the screen.
- [ ] Sidebar         : A composable, themeable and customizable sidebar component.
- [x] Skeleton        : Use to show a placeholder while content is loading.
- [x] Slider          : An input where the user selects a value from within a given range.
- [x] Spinner         : Rotating loading indicator to provide visual feedback to the user.
- [x] Squircle        : A container component that wraps content in a squircle shape - a squared circle with smooth corners.
- [x] Switch          : A control that allows the user to toggle between checked and not checked.
- [x] Table           : A responsive table component.
- [x] Tabs            : A set of layered sections of content—known as tab panels—that are displayed one at a time.
- [x] Text            : Displays a text or a component that looks like text. Adopted from Catalyst (TailwindUI)
- [x] Textarea        : Displays a form textarea or a component that looks like a textarea.
- [x] Toast           : A succinct message that is displayed temporarily.
- [x] Toggle          : A two-state button that can be either on or off.
- [x] Toggle Group    : A set of two-state buttons that can be toggled on or off.
- [x] Tooltip         : A popup that displays information related to an element when the element receives keyboard focus or the mouse hovers over it.
```

## License

This project is open-sourced software licensed under the [Apache License 2.0][choosealicense].

Copyrights in this project are retained by their contributors.

See the [license file](./LICENSE) for more information.

---

<sub>🤫 Psst! We are [hiring](https://zero-one-group.com/careers).

[choosealicense]: https://choosealicense.com/licenses/apache-2.0/
[shadcn]: https://ui.shadcn.com/
[tailwind-variants]: https://www.tailwind-variants.org/
