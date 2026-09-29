import React from 'react';
import { Composition } from 'remotion';
import { DURACION, Historia } from './Historia';

export const Root: React.FC = () => (
  <>
    <Composition id="Historia-es" component={Historia} durationInFrames={DURACION} fps={30} width={1920} height={1080} defaultProps={{ idioma: 'es' as const }} />
    <Composition id="Historia-en" component={Historia} durationInFrames={DURACION} fps={30} width={1920} height={1080} defaultProps={{ idioma: 'en' as const }} />
  </>
);
