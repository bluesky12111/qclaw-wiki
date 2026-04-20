---
title: "Wiki Schema"
---

# Wiki Page Schema

This document defines the standard format for all wiki pages.

<div class="zh-trans">本文档定义所有 Wiki 页面的标准格式。</div>

## Page Structure

Every page MUST follow this structure:

1. **Frontmatter** (YAML)
2. **Title** (H1)
3. **Summary** (2-3 sentences, bilingual)
4. **Body** (sections with bilingual content)
5. **Connections** (wikilinks to related pages)
6. **Sources** (citations)

## Frontmatter

```
---
title: "Page Title"
date: YYYY-MM-DD
tags: [tag1, tag2]
---
```

## Bilingual Content

Every paragraph should be written in English first, followed by a Chinese translation:

```
English paragraph here.

<div class="zh-trans">中文翻译在这里。</div>
```

### Rules

- Technical terms stay in English: Agent, Harness, CLI, LLM, SDK, API, RAG, MCP, etc.
- Proper nouns, product names, and code identifiers stay in English.
- Translate naturally for Chinese technical documentation style.
- Do NOT translate: frontmatter, code blocks, URLs, wikilinks.

## Wikilinks

Always use full paths from the content root:

- `[[topic-name/concepts/concept-name|Display Text]]` OK
- `[[concepts/concept-name|Display Text]]` WRONG (missing topic prefix)

## Directory Structure

```
content/
  index.md          # Wiki home & topic index
  log.md            # Change log
  SCHEMA.md         # This file
  {topic}/
    overview.md     # Topic overview & synthesis
    sources/        # Source summaries
    concepts/       # Concept definitions
    entities/       # Entity profiles
    synthesis/      # Cross-cutting analyses
```

## Connections Section

Every page should end with:

```
## Connections

- Related: [[topic/concepts/other-concept|Other Concept]]
- Parent: [[topic/overview|Topic Overview]]
```

## Sources Section

For pages with external references:

```
---
*Sources:*
- [Title](url) YYYY-MM
```

## Verification Markers

For unverified claims:

```
This claim comes from a single source. TODO: verify.
```

Pages with unverified claims should be reviewed within 180 days.
