class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? Link1;
  final String? Link2;
  final String? Link3;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.Link1,
    this.Link2,
    this.Link3,
  });
}

List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/space.jpg',
    title: 'Testing',
    subtitle: 'this is the testing for working!',
    Link3: 'https://mail.google.com/',
  ),
  ProjectUtils(
    image: 'assets/projects/space.jpg',
    title: 'Testing',
    subtitle: 'this is the testing for working!',
    Link3: 'https://mail.google.com/',
  ),
 
];

List<ProjectUtils> workProjectUtils = [
  // ProjectUtils(
  //   image: '',
  //   title: '',
  //   subtitle: '',
  //   Link1: '',
  // ),
  
    ProjectUtils(
    image: 'assets/projects/space.jpg',
    title: 'Testing',
    subtitle: 'this is the testing for working!',
    Link3: 'https://mail.google.com/',
  ),
  ProjectUtils(
    image: 'assets/projects/space.jpg',
    title: 'Testing',
    subtitle: 'this is the testing for working!',
    Link3: 'https://mail.google.com/',
  ),
  ProjectUtils(
    image: 'assets/projects/space.jpg',
    title: 'Testing',
    subtitle: 'this is the testing for working!',
    Link3: 'https://mail.google.com/',
  ),
  
];
