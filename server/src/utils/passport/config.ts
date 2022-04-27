import passport from 'passport';
import localStrategy from './localStrategy';


passport.use(localStrategy);

passport.initialize();