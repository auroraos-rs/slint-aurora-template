let org_domain = variable::get("org_domain");
let project_name = variable::get("project-name");

file::rename("rpm/icons/86x86/org.template.slint_aurora_project.png", `rpm/icons/86x86/${org_domain}.${project_name}.png`);
file::rename("rpm/icons/108x108/org.template.slint_aurora_project.png", `rpm/icons/108x108/${org_domain}.${project_name}.png`);
file::rename("rpm/icons/128x128/org.template.slint_aurora_project.png", `rpm/icons/128x128/${org_domain}.${project_name}.png`);
file::rename("rpm/icons/172x172/org.template.slint_aurora_project.png", `rpm/icons/172x172/${org_domain}.${project_name}.png`);
file::rename("rpm/org.template.slint_aurora_project.desktop", `rpm/${org_domain}.${project_name}.desktop`);
file::rename("rpm/org.template.slint_aurora_project.spec", `rpm/${org_domain}.${project_name}.spec`);
