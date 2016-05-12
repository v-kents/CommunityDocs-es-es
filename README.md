# Repo for MSDN & Technet Library Spanish-speaking community project (formerly known as MINITEL)

##TODO (now): 
- we should probably remove the /articles/ folder and just put topic-specific folders one level up (to reduce length of URL)
- rethink about the repo name "Community" in light of the fact that 
    - the /community/ portion of the URL can only be valid for one between MSDN and Technet not both, so it should be differentiated
    - this is only for Spanish nto for all langauges
        - need to ask Sandra if we can use the same repo names across locales (== can we use "Community" both for /es-es/library/community/ and for /it-it/library/community/ ? not much as for the repo name but as for the implications on the final URL structure
- check limitations of usage with non-ASCII charcters - especially on the URL

##Next Steps (not done yet, but immediately after the TODO)
- automate conversion of all Spanish articles from docx to md (with Pandoc)
- automate creation of TOC.md(s) based on existing .HxT files
- check whether it's better to keep one single TOC.md file or to split it in Main + Sub-TOCs (.yml files - check [this article](http://dotnet.github.io/docfx/tutorial/intro_toc.html) )
- we could define a *template* for articles that we could share to editors/MVPs so that they provide the final articles already in the right format (for consistent look and feel)? a bit like Azure does for their articles - see [here](https://github.com/Azure/azure-content/blob/master/markdown%20templates/markdown-template-for-new-articles.md). we could still convert from a docx file but it would be more work ofr us so we should also think about letting them enter articles directly

##Next Next (future evolutions / ideas)
- need to figure out how we can best leverage this platform in conjunction with comments and BI to create a single dashboard to track customer interest and feedback on these
- ...