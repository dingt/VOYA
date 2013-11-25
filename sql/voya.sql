-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 24, 2013 at 04:34 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `voya`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `url` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) 
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `location`, `url`) VALUES
(1, 'boston', 'Massachusetts', ''),
(2, 'brookline', 'Massachusetts', '');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE IF NOT EXISTS `districts` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `city_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `understand` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `city_id` (`city_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `city_id`, `name`, `understand`) VALUES
(1, 1, 'Allston and Brighton (Allston-Brighton)', 'Located west of Boston proper, these districts (especially Brighton) are primarily residential, and are home to many students and young professionals. Brighton is abutted by Boston College, which is the terminus of the Green Line''s B Branch. The border between the two is a subject of debate, so they are often considered to be one neighborhood by outsiders.'),
(2, 1, 'Chinatown', 'Great Asian food, great herbalists and next to downtown and the theater district. 4th largest Chinatown in the United States.'),
(3, 1, 'Downtown', 'This is the hub of tourist activity with Faneuil Hall, the Freedom Trail, Boston Public Garden, and Boston Common. It is also the center of city and state governments, businesses, and shopping.'),
(4, 1, 'Financial District', 'Boston''s business and financial center, this area has plenty of restaurants, bars, and tourist attractions such as the New England Aquarium.');

-- --------------------------------------------------------

--
-- Table structure for table `play`
--

CREATE TABLE IF NOT EXISTS `play` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `tpy` varchar(255) DEFAULT NULL,
  `city_id` int(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `explane` text,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `play`
--

INSERT INTO `play` (`id`, `tpy`, `city_id`, `location`, `explane`) VALUES
(1, 'do', 1, 'Newbury Street', ' Eight blocks of high-end boutiques, hair salons, and galleries. Makes for a fabulous day of shopping and dining. The shops and restaurants tend to be expensive, but one needn''t spend money to enjoy the area; one of Newbury''s main attractions is simply people-watching. College students, urban professionals, tourists, and street performers all mix here. Newbury Street is accessible on the Green Line from the Arlington, Copley, and Hynes stations.'),
(2, 'buy', 1, 'Newbury Street', 'This shopping street runs the length of the Back Bay neighborhood. Often called "the Rodeo Drive of the East," Newbury St is a wonderfully dense avenue colored by historic brownstones and lots of shops and restaurants. Extremely expensive near Boston Common, but gradually becoming more affordable as you move toward Massachusetts Avenue. One block north from Boylston St, which is similar but less so. Vehicular traffic can be very slow on Newbury St itself; take parallel streets unless you have time to see the sights from your car. Accessible on the Green Line from Arlington, Copley, and Hynes stations.');

-- --------------------------------------------------------

--
-- Table structure for table `see`
--

CREATE TABLE IF NOT EXISTS `see` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `city_id` int(255) NOT NULL,
  `place_name` varchar(255) DEFAULT NULL,
  `intro` text,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `see`
--

INSERT INTO `see` (`id`, `city_id`, `place_name`, `intro`) VALUES
(1, 1, 'Boston Children''s Museum', ' 300 Congress St, ? +1 617 426-7336. 10AM-5PM daily (F until 9PM). The Boston Children''s Museum is a large, modern museum recently built out of an industrial building along the Boston waterfront and relatively close to the Tea Party museum and the ICA. The quickest way to get there using mass transit is probably by walking from South Station, which is a large station on the Red Line. It has a variety of interactive exhibits about a considerable number of topics, as well as a reproduction of a traditionally Japanese house called the Kyoto House. It is also regularly host to a travelling exhibit from somewhere else in the country, which does not incur an additional admissions charge. It''s suitable for children of ages ranging from newborn to about 9. One of the most interesting things about the museum, particularly for children, is a 3-story climbing structure that lets the kids climb up from the ground floor to the third floor, in lieu of elevator or stairs. They support fitness and environmental sustainability programs, and they even have a green roof. It''s worthwhile if you''re bringing young children to Boston. $12, Ages 2–15 $12, Age 1 free. edit'),
(2, 1, 'USS Constitution Museum', 'Charlestown Navy Yard, ? +1 617 426-1812. Apr-Oct Tu-Su 10AM-6PM, Nov-Mar Th-Su 10AM-3:50PM. Tour famous Old Ironsides, enjoy all-ages hands-on exhibits on sailing skills and crafts. Freewill donation.');

-- --------------------------------------------------------

--
-- Table structure for table `understand`
--

CREATE TABLE IF NOT EXISTS `understand` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `city_id` int(255) NOT NULL,
  `visit_time` varchar(1000) DEFAULT NULL,
  `history` text,
  `today` text,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `understand`
--

INSERT INTO `understand` (`id`, `city_id`, `visit_time`, `history`, `today`) VALUES
(1, 1, 'New England is unpredictable and becomes very cold in the winter and is prone to bouts of humidity and some surprisingly high temperatures considering the region, often topping out in the 90s, in the summer. Boston summers are warm and humid, with sunshine 60-65% of the time and typical highs in the mid 70s to high 80s F (mid to upper 20s C).', 'Massachusetts'' first governor, John Winthrop, famously called Boston a "shining city on the hill," a reference to Jerusalem and a declaration of the original settlers'' intent to build a utopian Christian colony. From the very beginning, the people who lived there declared their home to be one of the most important cities in the world. Considering that the American Revolution and modern democracy got their start thanks to Bostonians, and that Winthrop’s quote is still used in modern political speech, one could argue that they were right!\r\n\r\nThe father of American jurist Oliver Wendell Holmes, Jr. (Dr. Oliver Wendell Holmes) once called the Boston statehouse "the hub of the solar system," but common usage has expanded to the now-current Hub of the Universe. This half-serious term is all you need to know to understand Boston''s complicated self-image. Vastly important in American history, and for centuries the seat of the USA''s social elite, Boston lost prominence in the early twentieth century, largely to the cities of New York, Chicago, Los Angeles, and San Francisco. Over the past two decades, Boston has regained political, cultural, and economic importance.\r\n\r\nIn 1629, Reverend William Blackstone was the first English immigrant to arrive in the city. A year later, John Winthrop and the Massachusetts Bay Colony had followed. The Massachusetts Bay Colony were Puritan religious dissidents who had fled England to find freedom in the New World. At the time the city was called Shawmut, a name coined by Native American settlers, however now a new settlement, Winthrop had decided to rename the city Boston after his hometown in England. Because of its easily-defended harbor and the fact that it is the closest port to Europe it rapidly assumed a leading role in the fledging New England region, with a booming economy based on trade with the Caribbean and Europe. The devastating Fire of 1760 destroyed much of the town, but within a few years the city had bounced back.\r\n\r\nBoston was also a city of great intellectual potential. Many statesmen had emerged in Boston along with prestigious Schools such as Harvard and the first public school in America, Boston Latin. With the founding of these schools as well as the first printing press in New England, Boston was becoming more of a colonial society.\r\n\r\nBostonians were the instigators of the independence movement in the 18th century and the city was the center of America''s revolutionary activity during the Colonial period. Several of the first Revolutionary War skirmishes were fought there, including the Boston Massacre, The Boston Tea Party, and the battles of Lexington and Concord -which were fought nearby. Boston''s direct involvement in the Revolution ended after the Battle of Bunker Hill and, soon afterwards, the ending of the Siege of Boston by George Washington. For some time afterwards the city''s political leaders continued to have a leading role in developing of the new country''s system of government. The residents'' ardent support of independence earned the city the nickname The Cradle of Liberty.\r\n\r\nThroughout the 19th century, Boston continued to grow rapidly, assimilating outlying towns into the metropolitan core. Its importance in American culture was inestimable, and its economic and literary elite, the so-called Boston Brahmins assumed the mantle of aristocracy in the United States. Their patronage of the arts and progressive social ideals was unprecedented in the New World, and often conflicted with the city''s Puritan foundations. They helped drive unprecedented scientific, educational and social change that would soon sweep the country. The Abolitionist movement, anesthesia and the telephone are a few examples of this.\r\n\r\nAt the same time, the city''s working class swelled with immigrants from Europe. The huge Irish influx made Boston one of the most important Irish cities in the world, in or out of Ireland. Gradually the Irish laborer population climbed into city''s upper class, evidenced no better than by the continued importance of the Kennedy family in national politics.\r\n\r\nFrom the early twentieth century until the 1970s, Boston''s importance on the national stage waned. Cities in what was once the frontier, like Chicago, San Francisco, and later Los Angeles, shifted the nation''s center of gravity away from liberty''s cradle. In the past two decades, Boston''s importance and influence has increased, due to growth in higher education, health care, high technology, and financial services. It remains America''s higher educational center; during the school year, one in five Bostonians are university students. There are more college students per square foot in Boston than any other city in the Western Hemisphere.\r\n\r\nBoston''s nicknames include "Beantown", "The Hub" (shortened from Oliver Wendell Holmes'' phrase ''The Hub of the Universe''), "The City of Higher Learning" (due to the plethora of universities and colleges in the Boston area) and - particularly in the 19th century - "The Athens of America," on account of its great cultural and intellectual influence. If you don''t want to stand out as a tourist, don''t refer to Boston by any of these nicknames. Locals generally don''t use any of them, except the heavy use of "Hub" in journalism (Boston takes up more headline space).\r\n', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
