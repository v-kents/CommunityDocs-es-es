# Repo for MSDN & Technet Library Spanish-speaking community project (formerly known as MINITEL)

TODO: 
- we should probably remove the /articles/ folder and just put topic-specific folders one level up (to reduce length of URL)
- rethink about the repo name "Community" in light of the fact that 
-- the /community/ portion of the URL can only be valid for one between MSDN and Technet not both, so it should be differentiated
-- this is only for Spanish nto for all langauges
--- need to ask Sandra if we can use the same repo names across locales (== can we use "Community" both for /es-es/library/community/ and for /it-it/library/community/ ? not much as for the repo name but as for the implications on the final URL structure
- check limitations of usage with non-ASCII charcters - especially on the URL

Next Steps
- automate conversion of all Spanish articles from docx to md (with Pandoc)
- automate creation of TOC.md(s) based on existing .HxT files
- check whether it's better to keep one single TOC.md file or to split it in Main + Sub-TOCs (.yml files - check [this article](http://dotnet.github.io/docfx/tutorial/intro_toc.html) )
